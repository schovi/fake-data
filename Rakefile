require "bundler/gem_tasks"
require "rake/testtask"

# Load FakeData rake tasks
Rake.add_rakelib 'lib/tasks'

# `rake test` to run tests
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

# or just `rake` to run tests
task :default => :test
