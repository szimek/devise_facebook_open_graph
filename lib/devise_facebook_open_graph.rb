# encoding: utf-8
require 'devise'
require 'active_support'

require 'devise_facebook_open_graph/rails/view_helpers'

module DeviseFacebookOpenGraph
  module Facebook
    extend ActiveSupport::Autoload
    autoload :Config
  end
end
