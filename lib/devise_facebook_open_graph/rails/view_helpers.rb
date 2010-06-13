# encoding: utf-8

module DeviseFacebookOpenGraph
  module Rails
    module ViewHelpers
      #
      # Inserts facebook HTML and javascript tag for initializing
      # JavaScript SDK. See http://developers.facebook.com/docs/authentication/: Single Sign-on.
      #
      # Some options to this helper-method might be added in the future :-)
      #
      def facebook_init_javascript_sdk
        buffer = content_tag :div, '', :id => 'fb-root'
        buffer << javascript_include_tag(DeviseFacebookOpenGraph::Facebook::Config.sdk_java_script_source)

        buffer << javascript_tag(<<-JAVASCRIPT)
          FB.init({
            appId: '#{DeviseFacebookOpenGraph::Facebook::Config.application_id}',
            status: true,
            cookie: true,
            xfbml: true
          });
        JAVASCRIPT

        buffer.html_safe
      end
    end
  end
end
