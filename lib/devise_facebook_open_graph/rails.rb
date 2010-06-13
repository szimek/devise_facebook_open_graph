ActiveSupport.on_load(:action_view) { include DeviseFacebookOpenGraph::Rails::ViewHelpers }
ActiveSupport.on_load(:action_controller) { include DeviseFacebookOpenGraph::Rails::ControllerHelpers }
