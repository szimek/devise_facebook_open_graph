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

            if user.present?
              success! user
            else
              # TODO Check if we are to auto-create user, and if so do that.
            end
          end
        end
      end
    end
  end
end

::Warden::Strategies.add(:facebook_open_graph_authenticatable, Devise::FacebookOpenGraphAuthenticatable::Strategies::FacebookOpenGraphAuthenticatable)
