# encoding: utf-8
require 'devise'


require 'devise_facebook_open_graph/rails'

module DeviseFacebookOpenGraph
  module Facebook
    extend ActiveSupport::Autoload

    autoload :Config
    autoload :Session
  end

  module Rails
    extend ActiveSupport::Autoload

    autoload :ViewHelpers
    autoload :ControllerHelpers
  end
end



require 'devise_facebook_open_graph/strategy'
require 'devise_facebook_open_graph/schema'

module Devise
  # 
  # Specifies database column name to store the facebook user id.
  #
  mattr_accessor :facebook_uid_field
  @@facebook_uid_field = :facebook_uid

  # 
  # Instructs this gem to auto create an account for facebook
  # users which have not visited before
  #
  mattr_accessor :facebook_auto_create_account
  @@facebook_auto_create_account = true

  #
  # Runs validation when auto creating users on facebook connect
  #
  mattr_accessor :run_validations_when_creating_facebook_user
  @@run_validations_when_creating_facebook_user = false

  #
  # Skip confirmation loop on facebook connection users
  #
  mattr_accessor :skip_confimation_for_facebook_users
  @@skip_confimation_for_facebook_users = true
end

Devise.add_module(:facebook_open_graph_authenticatable,
  :strategy => true,
  :controller => :sessions,
  :model => 'devise_facebook_open_graph/model'
)
