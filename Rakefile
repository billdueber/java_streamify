# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.platform = 'java'
  gem.name = "java_streamify"
  gem.homepage = "http://github.com/billdueber/java_streamify"
  gem.license = "MIT"
  gem.summary = %Q{Easily turn a filename (with optional .gz) or File object into a Java inputstream or outputstream}
  gem.description = %Q{that's really about it...}
  gem.email = "bill@dueber.com"
  gem.authors = ["Bill Dueber"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'yard'
YARD::Rake::YardocTask.new
