# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task default: %i[test rubocop]

# Clear the existing release task
Rake::Task["release"].clear

# Redefine it without the source_control_push dependency
task "release", [:remote] => ["build", "release:guard_clean", "release:rubygem_push"]
