=begin
#Passage Management API

#Passage's management API to manage your Passage apps and users.

The version of the OpenAPI document: 1
Contact: support@passage.id
Generated by: https://openapi-generator.tech
Generator version: 7.11.0-SNAPSHOT

=end

require 'date'
require 'time'

module OpenapiClient
  class UserStatus
    ACTIVE = "active".freeze
    INACTIVE = "inactive".freeze
    PENDING = "pending".freeze

    def self.all_vars
      @all_vars ||= [ACTIVE, INACTIVE, PENDING].freeze
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
      return value if UserStatus.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #UserStatus"
    end
  end
end
