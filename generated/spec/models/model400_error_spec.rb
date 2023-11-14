=begin
#Passage Management API

#Passage's management API to manage your Passage apps and users.

The version of the OpenAPI document: 1
Contact: support@passage.id
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.1.0

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for OpenapiClient::Model400Error
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe OpenapiClient::Model400Error do
  let(:instance) { OpenapiClient::Model400Error.new }

  describe 'test an instance of Model400Error' do
    it 'should create an instance of Model400Error' do
      # uncomment below to test the instance creation
      #expect(instance).to be_instance_of(OpenapiClient::Model400Error)
    end
  end

  describe 'test attribute "code"' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["invalid_request", "custom_provider_required"])
      # validator.allowable_values.each do |value|
      #   expect { instance.code = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "error"' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

end
