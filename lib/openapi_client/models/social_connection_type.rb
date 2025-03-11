=begin
#Passage Management API

#Passage's management API to manage your Passage apps and users.

The version of the OpenAPI document: 1
Contact: support@passage.id
Generated by: https://openapi-generator.tech
Generator version: 7.10.0

=end

require 'date'
require 'time'

module OpenapiClient
  class SocialConnectionType
    APPLE = "apple".freeze
    GITHUB = "github".freeze
    GOOGLE = "google".freeze

    def self.all_vars
      @all_vars ||= [APPLE, GITHUB, GOOGLE].freeze
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      return value if SocialConnectionType.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #SocialConnectionType"
    end
  end
end
