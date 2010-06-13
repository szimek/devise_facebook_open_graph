# encoding: utf-8
require 'devise'

module Devise
  module Models
    module FacebookOpenGraphAuthenticatable
      extend ActiveSupport::Concern


      module ClassMethods
        Devise::Models.config(self, :facebook_uid_field, :facebook_auto_create_account)

        def facebook_auto_create_account?
          !!facebook_auto_create_account
        end
      end
    end
  end
end
