# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{devise_facebook_open_graph}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thorbj\303\270rn Hermansen"]
  s.date = %q{2010-07-07}
  s.description = %q{Extends Devise with an authentication strategy against Facebook's Open Graph and it's JavaScrip SDK}
  s.email = %q{thhermansen@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "devise_facebook_open_graph.gemspec",
     "init.rb",
     "lib/devise_facebook_open_graph.rb",
     "lib/devise_facebook_open_graph/facebook/config.rb",
     "lib/devise_facebook_open_graph/facebook/session.rb",
     "lib/devise_facebook_open_graph/model.rb",
     "lib/devise_facebook_open_graph/rails.rb",
     "lib/devise_facebook_open_graph/rails/controller_helpers.rb",
     "lib/devise_facebook_open_graph/rails/view_helpers.rb",
     "lib/devise_facebook_open_graph/schema.rb",
     "lib/devise_facebook_open_graph/strategy.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/thhermansen/devise_facebook_open_graph}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Extends Devise with an authentication strategy against Facebook}
  s.test_files = [
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0.beta3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<devise>, [">= 1.1.rc1"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_runtime_dependency(%q<koala>, [">= 0.8.0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0.beta3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<devise>, [">= 1.1.rc1"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<koala>, [">= 0.8.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0.beta3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<devise>, [">= 1.1.rc1"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<koala>, [">= 0.8.0"])
  end
end

