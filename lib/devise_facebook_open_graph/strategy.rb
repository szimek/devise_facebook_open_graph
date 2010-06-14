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

        def authenticate!
          session = DeviseFacebookOpenGraph::Facebook::Session.new(cookies)

          if session.valid?
            klass = mapping.to 
            user = klass.authenticate_facebook_user session.uid
            
            if user.blank?
              if klass.facebook_auto_create_account?
                user = klass.new.tap do |user|
                  user.facebook_session = session
                  user.set_facebook_credentials_from_session!
                  user.run_callbacks :initialize_by_facebook
                end
                
                # TODO SAVE and fix invalid state on object if it has no email and that is a required field..
              end
            end

            if user.present? && user.persisted?
              user.facebook_session = session
              user.run_callbacks :connecting_to_facebook do
                success! user
              end
            end
          end
        end
      end
    end
  end
end

::Warden::Strategies.add(:facebook_open_graph_authenticatable, Devise::FacebookOpenGraphAuthenticatable::Strategies::FacebookOpenGraphAuthenticatable)
