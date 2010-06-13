# encoding: utf-8
require 'devise'

require 'devise_facebook_open_graph/facebook/config'
require 'devise_facebook_open_graph/rails/view_helpers'

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
end

Devise.add_module(:facebook_open_graph_authenticatable,
  :strategy => true,
  :controller => :sessions,
  :model => 'devise_facebook_open_graph/model'
)
