# encoding: utf-8

require 'devise/strategies/base'

module Devise
  module FacebookOpenGraphAuthenticatable
    module Strategies
      class FacebookOpenGraphAuthenticatable < ::Devise::Strategies::Base
        #
        # This strategy is valid if Facebook has set it's session data object in
        # current application's domain cookies.
        #
        def valid?
          mapping.to.respond_to?(:authenticate_facebook_user) && request.cookies.has_key?(::DeviseFacebookOpenGraph::Facebook::Config.facebook_session_name)
        end

        #
        # Authenticates the user as if this requests seems
        # valid as FacebookOpenGraphAuthenticatable
        #
        # Tries to auto create the user if configured to do so.
        #
        def authenticate!
          session = DeviseFacebookOpenGraph::Facebook::Session.new(request.cookies)

          if session.valid?
            klass = mapping.to
            user = klass.authenticate_facebook_user(session.uid)

            if user.blank? && klass.facebook_auto_create_account?
              user = klass.new
              user.facebook_session = session
              user.set_facebook_credentials_from_session!

              begin
                user.before_create_by_facebook if user.respond_to?(:before_create_by_facebook)
                user.save(klass.run_validations_when_creating_facebook_user)
                user.after_create_by_facebook if user.respond_to?(:after_create_by_facebook)
              rescue ActiveRecord::RecordNotUnique
                fail!(:not_unique_user_on_creation) and return
              end

              if klass.run_validations_when_creating_facebook_user && !user.persisted?
                fail!(:invalid_facebook_user_on_creation) and return
              end
            end

            if user.present? && user.persisted?
              user.facebook_session = session
              user.before_connecting_to_facebook if user.respond_to?(:before_connecting_to_facebook)
              success!(user)
              user.after_connecting_to_facebook if user.respond_to?(:after_connecting_to_facebook)
            else
              fail!(:facebook_user_not_found_locally) and return
            end
          else
            fail!(:invalid_facebook_session) and return
          end
        end
      end
    end
  end
end

::Warden::Strategies.add(:facebook_open_graph_authenticatable, Devise::FacebookOpenGraphAuthenticatable::Strategies::FacebookOpenGraphAuthenticatable)
