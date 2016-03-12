$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fake_data'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'pry'

Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)
