# encoding: utf-8
require "yaml"

#
# Provides basic Facebook functionality. You can ask it for
# the current configuration strings like Facebook.api_key,
# Facebook.application_id and Facebook.application_secret.
#
class DeviseFacebookOpenGraph::Facebook::Config
  class << self
    attr_accessor :path

    %w(application_id api_key application_secret).each do |config_key|
      define_method config_key do
        instance_variable_get('@'+config_key) or 
        instance_variable_set('@'+config_key, config[config_key].value)
      end
    end
    
    def sdk_java_script_source
      "http://connect.facebook.net/#{I18n.locale}/all.js"
    end

    private
      def config_file_path
        path || Rails.root.join('config', 'facebook.yml')
      end

      def config
        @config ||= YAML.parse_file(config_file_path)[Rails.env]
      end
  end
end
