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
          mapping.to.respond_to?(:authenticate_facebook_user) && cookies.has_key?(::DeviseFacebookOpenGraph::Facebook::Config.facebook_session_name)
        end

        #
        # Authenticates the user as if this requests seems
        # valid as FacebookOpenGraphAuthenticatable
        #
        # Tries to auto create the user if configured to do so.
        #
        def authenticate!
          session = DeviseFacebookOpenGraph::Facebook::Session.new(cookies)

          if session.valid?
            klass = mapping.to 
            user = klass.authenticate_facebook_user session.uid
            
            if user.blank? && klass.facebook_auto_create_account?
              user = klass.new
              user.facebook_session = session
              user.run_callbacks :create_by_facebook do
                user.set_facebook_credentials_from_session!
                begin
                  user.save(:validate => klass.run_validations_when_creating_facebook_user)
                rescue ActiveRecord::RecordNotUnique
                  fail! :not_unique_user_on_creation
                end
              end

              if klass.run_validations_when_creating_facebook_user && !user.persisted?
                fail! :invalid_facebook_user_on_creation
              end
            end

            if user.present? && user.persisted?
              user.facebook_session = session
              user.run_callbacks :connecting_to_facebook do
                success! user
              end
            else
              fail! :facebook_user_not_found_locally
            end
          else
            fail! :invalid_facebook_session
          end
        end
      end
    end
  end
end

::Warden::Strategies.add(:facebook_open_graph_authenticatable, Devise::FacebookOpenGraphAuthenticatable::Strategies::FacebookOpenGraphAuthenticatable)
