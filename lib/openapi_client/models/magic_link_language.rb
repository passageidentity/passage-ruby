=begin
#Passage Management API

#Passage's management API to manage your Passage apps and users.

The version of the OpenAPI document: 1
Contact: support@passage.id
Generated by: https://openapi-generator.tech
Generator version: 7.13.0-SNAPSHOT

=end

require 'date'
require 'time'

module OpenapiClient
  class MagicLinkLanguage
    DE = "de".freeze
    EN = "en".freeze
    ES = "es".freeze
    IT = "it".freeze
    PL = "pl".freeze
    PT = "pt".freeze
    ZH = "zh".freeze

    def self.all_vars
      @all_vars ||= [DE, EN, ES, IT, PL, PT, ZH].freeze
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
      return value if MagicLinkLanguage.all_vars.include?(value)
      raise "Invalid ENUM value #{value} for class #MagicLinkLanguage"
    end
  end
end
