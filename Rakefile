#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new 'spec'


task :default => [:make_parser, :spec]

task :make_parser do
  `tt -o lib/fields/parser.rb grammar/fields.tt`
end
