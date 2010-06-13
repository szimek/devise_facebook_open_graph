# encoding: utf-8

require 'devise/strategies/base'

module Devise
  module FacebookOpenGraphAuthenticatable
    module Strategies
      class FacebookOpenGraphAuthenticatable < ::Devise::Strategies::Base
        def valid?
          false
        end

        def authenticate!
        end
      end
    end
  end
end

::Warden::Strategies.add(:facebook_open_graph_authenticatable, Devise::FacebookOpenGraphAuthenticatable::Strategies::FacebookOpenGraphAuthenticatable)
