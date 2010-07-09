# -*- coding: utf-8 -*-
require 'rubygems'
require 'rake'
require 'bundler'

Bundler.setup

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "devise_facebook_open_graph"
    gem.summary = %Q{Extends Devise with an authentication strategy against Facebook}
    gem.description = %Q{Extends Devise with an authentication strategy against Facebook's Open Graph and it's JavaScrip SDK}
    gem.email = "thhermansen@gmail.com"
    gem.homepage = "http://github.com/thhermansen/devise_facebook_open_graph"
    gem.authors = ["Thorbjørn Hermansen"]
    gem.add_bundler_dependencies
  end
  Jeweler::GemcutterTasks.new
end


require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "devise_facebook_open_graph #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
