# encoding: utf-8

module DeviseFacebookOpenGraph
  module Rails
    module ControllerHelpers
      extend ActiveSupport::Concern

      included do
        helper_method :facebook_session
      end

      def facebook_session
        @facebook_session ||= DeviseFacebookOpenGraph::Facebook::Session.new(cookies)
      end
    end
  end
end
