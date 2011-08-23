# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "make_voteable/version"

Gem::Specification.new do |s|
  s.name        = "make_voteable"
  s.version     = MakeVoteable::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Antonio Antillon"]
  s.email       = ["antillas21@gmail.com"]
  s.homepage    = "http://antillas.tumblr.com"
  s.summary     = %q{User-centric voting system for Rails 3 applications using DataMapper.}
  s.description = %q{User-centric voting system for Rails 3 applications using DataMapper. This gem is a port of medihack make_voteable gem, which uses ActiveRecord as ORM. https://github.com/medihack/make_voteable.}

  s.rubyforge_project = "make_voteable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
