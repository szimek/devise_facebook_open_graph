$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'devise_facebook_open_graph'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end
