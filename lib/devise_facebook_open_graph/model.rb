# encoding: utf-8
require 'devise'

module Devise
  module Models
    module FacebookOpenGraphAuthenticatable
      extend ActiveSupport::Concern

      included do
        attr_accessor :facebook_session
        define_model_callbacks :connecting_to_facebook
      end


      module ClassMethods
        Devise::Models.config(self, :facebook_uid_field, :facebook_auto_create_account)

        def facebook_auto_create_account?
          !!facebook_auto_create_account
        end

        def authenticate_facebook_user(facebook_uid)
          send("find_by_" + facebook_uid_field.to_s, facebook_uid)
        end
      end
    end
  end
end
