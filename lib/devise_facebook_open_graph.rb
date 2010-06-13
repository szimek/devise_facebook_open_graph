# encoding: utf-8
require 'devise'
require 'active_support'

module DeviseFacebookOpenGraph
  module Facebook
    extend ActiveSupport::Autoload
    autoload :Config
  end
end
