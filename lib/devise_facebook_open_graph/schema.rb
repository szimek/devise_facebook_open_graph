# encoding: utf-8

module DeviseFacebookOpenGraph
  module Schema
    def facebook_open_graph_authenticatable
      apply_schema ::Devise.facebook_uid_field, :integer, :limit => 8
    end
  end
end

Devise::Schema.module_eval do
  include DeviseFacebookOpenGraph::Schema
end
