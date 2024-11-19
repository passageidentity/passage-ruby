# frozen_string_literal: true

Dir["#{File.dirname(File.absolute_path(__FILE__))}/**/*_test.rb"].each do |file|
  require file
end
