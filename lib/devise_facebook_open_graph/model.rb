# encoding: utf-8
require 'devise'

module Devise
  module Models
    module FacebookOpenGraphAuthenticatable
      extend ActiveSupport::Concern

      included do
        attr_accessor :facebook_session
      end

      module ClassMethods
        Devise::Models.config(self,
          :facebook_uid_field, :facebook_auto_create_account, :run_validations_when_creating_facebook_user,
          :skip_confimation_for_facebook_users
        )

        def facebook_auto_create_account?
          !!facebook_auto_create_account
        end

        def authenticate_facebook_user(facebook_uid)
          send("find_by_" + facebook_uid_field.to_s, facebook_uid)
        end
      end

      def set_facebook_credentials_from_session!
        raise "Can't set facebook credentials from session without the session!" if facebook_session.blank?
        send(self.class.facebook_uid_field.to_s+'=', facebook_session.uid)
        make_facebook_model_valid!
      end

      def authenticated_via_facebook?
        read_attribute(self.class.facebook_uid_field).present?
      end

      private
        #
        # In case of model having included other modules like
        # database_authenticate and so on we need to "by pass" some validations etc.
        #
        def make_facebook_model_valid!
          # These database fields are required if authenticable is used
          write_attribute(:password_salt, '') if self.respond_to?(:password_salt)
          write_attribute(:encrypted_password, '') if self.respond_to?(:encrypted_password)

          skip_confirmation! if self.class.skip_confimation_for_facebook_users && respond_to?(:skip_confirmation!)
        end
    end
  end
end
