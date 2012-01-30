# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name         = "jruby-opennlp"
  s.authors      = "Jason Langenauer"
  s.summary      = "Jruby wrapper of OpenNLP"
  s.description  = "A JRuby wrapper for the Apache OpenNLP library"
  s.version      = OpenNLP::VERSION
  s.platform     = Gem::Platform::Ruby

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = ['lib']

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~>1.3.1"
end
