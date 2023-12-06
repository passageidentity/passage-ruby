=begin
#Passage Management API

#Passage's management API to manage your Passage apps and users.

The version of the OpenAPI document: 1
Contact: support@passage.id
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.1.0

=end

require 'date'
require 'time'

module OpenapiClient
  class TtlDisplayUnit
    S = "s".freeze
    M = "m".freeze
    H = "h".freeze
    D = "d".freeze

    def self.all_vars
      @all_vars ||= [S, M, H, D].freeze
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
      return value if TtlDisplayUnit.all_vars.include?(value) || value == ""
      raise "Invalid ENUM value #{value} for class #TtlDisplayUnit"
    end
  end
end
