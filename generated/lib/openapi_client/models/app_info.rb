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
  class AppInfo
    attr_accessor :additional_auth_origins

    # The valid URLs where users can be redirected after authentication.
    attr_accessor :allowed_callback_urls

    attr_accessor :allowed_identifier

    # The valid URLs where users can be redirected after logging out.
    attr_accessor :allowed_logout_urls

    # A route within your application that redirects to the Authorization URL endpoint.
    attr_accessor :application_login_uri

    # Deprecated Property. Please refer to `auth_methods` to view settings for individual authentication methods.
    attr_accessor :auth_fallback_method

    # Deprecated Property. Please refer to `auth_methods` to view settings for individual authentication methods.
    attr_accessor :auth_fallback_method_ttl

    attr_accessor :auth_methods

    attr_accessor :auth_origin

    attr_accessor :created_at

    attr_accessor :default_language

    attr_accessor :id

    attr_accessor :layouts

    attr_accessor :login_url

    attr_accessor :light_logo_url

    attr_accessor :dark_logo_url

    attr_accessor :name

    # whether or not the app's login page hosted by passage
    attr_accessor :hosted

    # the subdomain of the app's hosted login page
    attr_accessor :hosted_subdomain

    attr_accessor :id_token_lifetime

    attr_accessor :passage_branding

    attr_accessor :profile_management

    attr_accessor :public_signup

    attr_accessor :redirect_url

    attr_accessor :refresh_absolute_lifetime

    attr_accessor :refresh_enabled

    attr_accessor :refresh_inactivity_lifetime

    attr_accessor :require_email_verification

    attr_accessor :require_identifier_verification

    attr_accessor :required_identifier

    attr_accessor :role

    attr_accessor :rsa_public_key

    # can only be retrieved by an app admin
    attr_accessor :secret

    attr_accessor :session_timeout_length

    attr_accessor :type

    attr_accessor :user_metadata_schema

    attr_accessor :technologies

    attr_accessor :element_customization

    attr_accessor :element_customization_dark

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'additional_auth_origins' => :'additional_auth_origins',
        :'allowed_callback_urls' => :'allowed_callback_urls',
        :'allowed_identifier' => :'allowed_identifier',
        :'allowed_logout_urls' => :'allowed_logout_urls',
        :'application_login_uri' => :'application_login_uri',
        :'auth_fallback_method' => :'auth_fallback_method',
        :'auth_fallback_method_ttl' => :'auth_fallback_method_ttl',
        :'auth_methods' => :'auth_methods',
        :'auth_origin' => :'auth_origin',
        :'created_at' => :'created_at',
        :'default_language' => :'default_language',
        :'id' => :'id',
        :'layouts' => :'layouts',
        :'login_url' => :'login_url',
        :'light_logo_url' => :'light_logo_url',
        :'dark_logo_url' => :'dark_logo_url',
        :'name' => :'name',
        :'hosted' => :'hosted',
        :'hosted_subdomain' => :'hosted_subdomain',
        :'id_token_lifetime' => :'id_token_lifetime',
        :'passage_branding' => :'passage_branding',
        :'profile_management' => :'profile_management',
        :'public_signup' => :'public_signup',
        :'redirect_url' => :'redirect_url',
        :'refresh_absolute_lifetime' => :'refresh_absolute_lifetime',
        :'refresh_enabled' => :'refresh_enabled',
        :'refresh_inactivity_lifetime' => :'refresh_inactivity_lifetime',
        :'require_email_verification' => :'require_email_verification',
        :'require_identifier_verification' => :'require_identifier_verification',
        :'required_identifier' => :'required_identifier',
        :'role' => :'role',
        :'rsa_public_key' => :'rsa_public_key',
        :'secret' => :'secret',
        :'session_timeout_length' => :'session_timeout_length',
        :'type' => :'type',
        :'user_metadata_schema' => :'user_metadata_schema',
        :'technologies' => :'technologies',
        :'element_customization' => :'element_customization',
        :'element_customization_dark' => :'element_customization_dark'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'additional_auth_origins' => :'Array<String>',
        :'allowed_callback_urls' => :'Array<String>',
        :'allowed_identifier' => :'String',
        :'allowed_logout_urls' => :'Array<String>',
        :'application_login_uri' => :'String',
        :'auth_fallback_method' => :'String',
        :'auth_fallback_method_ttl' => :'Integer',
        :'auth_methods' => :'AuthMethods',
        :'auth_origin' => :'String',
        :'created_at' => :'Time',
        :'default_language' => :'String',
        :'id' => :'String',
        :'layouts' => :'Layouts',
        :'login_url' => :'String',
        :'light_logo_url' => :'String',
        :'dark_logo_url' => :'String',
        :'name' => :'String',
        :'hosted' => :'Boolean',
        :'hosted_subdomain' => :'String',
        :'id_token_lifetime' => :'Integer',
        :'passage_branding' => :'Boolean',
        :'profile_management' => :'Boolean',
        :'public_signup' => :'Boolean',
        :'redirect_url' => :'String',
        :'refresh_absolute_lifetime' => :'Integer',
        :'refresh_enabled' => :'Boolean',
        :'refresh_inactivity_lifetime' => :'Integer',
        :'require_email_verification' => :'Boolean',
        :'require_identifier_verification' => :'Boolean',
        :'required_identifier' => :'String',
        :'role' => :'String',
        :'rsa_public_key' => :'String',
        :'secret' => :'String',
        :'session_timeout_length' => :'Integer',
        :'type' => :'String',
        :'user_metadata_schema' => :'Array<UserMetadataField>',
        :'technologies' => :'Array<Technologies>',
        :'element_customization' => :'ElementCustomization',
        :'element_customization_dark' => :'ElementCustomization'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `OpenapiClient::AppInfo` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `OpenapiClient::AppInfo`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'additional_auth_origins')
        if (value = attributes[:'additional_auth_origins']).is_a?(Array)
          self.additional_auth_origins = value
        end
      else
        self.additional_auth_origins = nil
      end

      if attributes.key?(:'allowed_callback_urls')
        if (value = attributes[:'allowed_callback_urls']).is_a?(Array)
          self.allowed_callback_urls = value
        end
      else
        self.allowed_callback_urls = nil
      end

      if attributes.key?(:'allowed_identifier')
        self.allowed_identifier = attributes[:'allowed_identifier']
      else
        self.allowed_identifier = nil
      end

      if attributes.key?(:'allowed_logout_urls')
        if (value = attributes[:'allowed_logout_urls']).is_a?(Array)
          self.allowed_logout_urls = value
        end
      else
        self.allowed_logout_urls = nil
      end

      if attributes.key?(:'application_login_uri')
        self.application_login_uri = attributes[:'application_login_uri']
      else
        self.application_login_uri = nil
      end

      if attributes.key?(:'auth_fallback_method')
        self.auth_fallback_method = attributes[:'auth_fallback_method']
      else
        self.auth_fallback_method = nil
      end

      if attributes.key?(:'auth_fallback_method_ttl')
        self.auth_fallback_method_ttl = attributes[:'auth_fallback_method_ttl']
      else
        self.auth_fallback_method_ttl = nil
      end

      if attributes.key?(:'auth_methods')
        self.auth_methods = attributes[:'auth_methods']
      else
        self.auth_methods = nil
      end

      if attributes.key?(:'auth_origin')
        self.auth_origin = attributes[:'auth_origin']
      else
        self.auth_origin = nil
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      else
        self.created_at = nil
      end

      if attributes.key?(:'default_language')
        self.default_language = attributes[:'default_language']
      else
        self.default_language = nil
      end

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      else
        self.id = nil
      end

      if attributes.key?(:'layouts')
        self.layouts = attributes[:'layouts']
      else
        self.layouts = nil
      end

      if attributes.key?(:'login_url')
        self.login_url = attributes[:'login_url']
      else
        self.login_url = nil
      end

      if attributes.key?(:'light_logo_url')
        self.light_logo_url = attributes[:'light_logo_url']
      end

      if attributes.key?(:'dark_logo_url')
        self.dark_logo_url = attributes[:'dark_logo_url']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      else
        self.name = nil
      end

      if attributes.key?(:'hosted')
        self.hosted = attributes[:'hosted']
      else
        self.hosted = nil
      end

      if attributes.key?(:'hosted_subdomain')
        self.hosted_subdomain = attributes[:'hosted_subdomain']
      else
        self.hosted_subdomain = nil
      end

      if attributes.key?(:'id_token_lifetime')
        self.id_token_lifetime = attributes[:'id_token_lifetime']
      end

      if attributes.key?(:'passage_branding')
        self.passage_branding = attributes[:'passage_branding']
      else
        self.passage_branding = nil
      end

      if attributes.key?(:'profile_management')
        self.profile_management = attributes[:'profile_management']
      else
        self.profile_management = nil
      end

      if attributes.key?(:'public_signup')
        self.public_signup = attributes[:'public_signup']
      else
        self.public_signup = nil
      end

      if attributes.key?(:'redirect_url')
        self.redirect_url = attributes[:'redirect_url']
      else
        self.redirect_url = nil
      end

      if attributes.key?(:'refresh_absolute_lifetime')
        self.refresh_absolute_lifetime = attributes[:'refresh_absolute_lifetime']
      else
        self.refresh_absolute_lifetime = nil
      end

      if attributes.key?(:'refresh_enabled')
        self.refresh_enabled = attributes[:'refresh_enabled']
      else
        self.refresh_enabled = nil
      end

      if attributes.key?(:'refresh_inactivity_lifetime')
        self.refresh_inactivity_lifetime = attributes[:'refresh_inactivity_lifetime']
      else
        self.refresh_inactivity_lifetime = nil
      end

      if attributes.key?(:'require_email_verification')
        self.require_email_verification = attributes[:'require_email_verification']
      else
        self.require_email_verification = nil
      end

      if attributes.key?(:'require_identifier_verification')
        self.require_identifier_verification = attributes[:'require_identifier_verification']
      else
        self.require_identifier_verification = nil
      end

      if attributes.key?(:'required_identifier')
        self.required_identifier = attributes[:'required_identifier']
      else
        self.required_identifier = nil
      end

      if attributes.key?(:'role')
        self.role = attributes[:'role']
      else
        self.role = nil
      end

      if attributes.key?(:'rsa_public_key')
        self.rsa_public_key = attributes[:'rsa_public_key']
      else
        self.rsa_public_key = nil
      end

      if attributes.key?(:'secret')
        self.secret = attributes[:'secret']
      end

      if attributes.key?(:'session_timeout_length')
        self.session_timeout_length = attributes[:'session_timeout_length']
      else
        self.session_timeout_length = nil
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      else
        self.type = nil
      end

      if attributes.key?(:'user_metadata_schema')
        if (value = attributes[:'user_metadata_schema']).is_a?(Array)
          self.user_metadata_schema = value
        end
      else
        self.user_metadata_schema = nil
      end

      if attributes.key?(:'technologies')
        if (value = attributes[:'technologies']).is_a?(Array)
          self.technologies = value
        end
      else
        self.technologies = nil
      end

      if attributes.key?(:'element_customization')
        self.element_customization = attributes[:'element_customization']
      else
        self.element_customization = nil
      end

      if attributes.key?(:'element_customization_dark')
        self.element_customization_dark = attributes[:'element_customization_dark']
      else
        self.element_customization_dark = nil
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @additional_auth_origins.nil?
        invalid_properties.push('invalid value for "additional_auth_origins", additional_auth_origins cannot be nil.')
      end

      if @allowed_callback_urls.nil?
        invalid_properties.push('invalid value for "allowed_callback_urls", allowed_callback_urls cannot be nil.')
      end

      if @allowed_identifier.nil?
        invalid_properties.push('invalid value for "allowed_identifier", allowed_identifier cannot be nil.')
      end

      if @allowed_logout_urls.nil?
        invalid_properties.push('invalid value for "allowed_logout_urls", allowed_logout_urls cannot be nil.')
      end

      if @application_login_uri.nil?
        invalid_properties.push('invalid value for "application_login_uri", application_login_uri cannot be nil.')
      end

      if @auth_fallback_method.nil?
        invalid_properties.push('invalid value for "auth_fallback_method", auth_fallback_method cannot be nil.')
      end

      if @auth_fallback_method_ttl.nil?
        invalid_properties.push('invalid value for "auth_fallback_method_ttl", auth_fallback_method_ttl cannot be nil.')
      end

      if @auth_methods.nil?
        invalid_properties.push('invalid value for "auth_methods", auth_methods cannot be nil.')
      end

      if @auth_origin.nil?
        invalid_properties.push('invalid value for "auth_origin", auth_origin cannot be nil.')
      end

      if @created_at.nil?
        invalid_properties.push('invalid value for "created_at", created_at cannot be nil.')
      end

      if @default_language.nil?
        invalid_properties.push('invalid value for "default_language", default_language cannot be nil.')
      end

      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @layouts.nil?
        invalid_properties.push('invalid value for "layouts", layouts cannot be nil.')
      end

      if @login_url.nil?
        invalid_properties.push('invalid value for "login_url", login_url cannot be nil.')
      end

      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @hosted.nil?
        invalid_properties.push('invalid value for "hosted", hosted cannot be nil.')
      end

      if @hosted_subdomain.nil?
        invalid_properties.push('invalid value for "hosted_subdomain", hosted_subdomain cannot be nil.')
      end

      if @passage_branding.nil?
        invalid_properties.push('invalid value for "passage_branding", passage_branding cannot be nil.')
      end

      if @profile_management.nil?
        invalid_properties.push('invalid value for "profile_management", profile_management cannot be nil.')
      end

      if @public_signup.nil?
        invalid_properties.push('invalid value for "public_signup", public_signup cannot be nil.')
      end

      if @redirect_url.nil?
        invalid_properties.push('invalid value for "redirect_url", redirect_url cannot be nil.')
      end

      if @refresh_absolute_lifetime.nil?
        invalid_properties.push('invalid value for "refresh_absolute_lifetime", refresh_absolute_lifetime cannot be nil.')
      end

      if @refresh_enabled.nil?
        invalid_properties.push('invalid value for "refresh_enabled", refresh_enabled cannot be nil.')
      end

      if @refresh_inactivity_lifetime.nil?
        invalid_properties.push('invalid value for "refresh_inactivity_lifetime", refresh_inactivity_lifetime cannot be nil.')
      end

      if @require_email_verification.nil?
        invalid_properties.push('invalid value for "require_email_verification", require_email_verification cannot be nil.')
      end

      if @require_identifier_verification.nil?
        invalid_properties.push('invalid value for "require_identifier_verification", require_identifier_verification cannot be nil.')
      end

      if @required_identifier.nil?
        invalid_properties.push('invalid value for "required_identifier", required_identifier cannot be nil.')
      end

      if @role.nil?
        invalid_properties.push('invalid value for "role", role cannot be nil.')
      end

      if @rsa_public_key.nil?
        invalid_properties.push('invalid value for "rsa_public_key", rsa_public_key cannot be nil.')
      end

      if @session_timeout_length.nil?
        invalid_properties.push('invalid value for "session_timeout_length", session_timeout_length cannot be nil.')
      end

      if @type.nil?
        invalid_properties.push('invalid value for "type", type cannot be nil.')
      end

      if @user_metadata_schema.nil?
        invalid_properties.push('invalid value for "user_metadata_schema", user_metadata_schema cannot be nil.')
      end

      if @technologies.nil?
        invalid_properties.push('invalid value for "technologies", technologies cannot be nil.')
      end

      if @element_customization.nil?
        invalid_properties.push('invalid value for "element_customization", element_customization cannot be nil.')
      end

      if @element_customization_dark.nil?
        invalid_properties.push('invalid value for "element_customization_dark", element_customization_dark cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @additional_auth_origins.nil?
      return false if @allowed_callback_urls.nil?
      return false if @allowed_identifier.nil?
      return false if @allowed_logout_urls.nil?
      return false if @application_login_uri.nil?
      return false if @auth_fallback_method.nil?
      return false if @auth_fallback_method_ttl.nil?
      return false if @auth_methods.nil?
      return false if @auth_origin.nil?
      return false if @created_at.nil?
      return false if @default_language.nil?
      return false if @id.nil?
      return false if @layouts.nil?
      return false if @login_url.nil?
      return false if @name.nil?
      return false if @hosted.nil?
      return false if @hosted_subdomain.nil?
      return false if @passage_branding.nil?
      return false if @profile_management.nil?
      return false if @public_signup.nil?
      return false if @redirect_url.nil?
      return false if @refresh_absolute_lifetime.nil?
      return false if @refresh_enabled.nil?
      return false if @refresh_inactivity_lifetime.nil?
      return false if @require_email_verification.nil?
      return false if @require_identifier_verification.nil?
      return false if @required_identifier.nil?
      return false if @role.nil?
      return false if @rsa_public_key.nil?
      return false if @session_timeout_length.nil?
      return false if @type.nil?
      type_validator = EnumAttributeValidator.new('String', ["complete", "flex"])
      return false unless type_validator.valid?(@type)
      return false if @user_metadata_schema.nil?
      return false if @technologies.nil?
      return false if @element_customization.nil?
      return false if @element_customization_dark.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["complete", "flex"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          additional_auth_origins == o.additional_auth_origins &&
          allowed_callback_urls == o.allowed_callback_urls &&
          allowed_identifier == o.allowed_identifier &&
          allowed_logout_urls == o.allowed_logout_urls &&
          application_login_uri == o.application_login_uri &&
          auth_fallback_method == o.auth_fallback_method &&
          auth_fallback_method_ttl == o.auth_fallback_method_ttl &&
          auth_methods == o.auth_methods &&
          auth_origin == o.auth_origin &&
          created_at == o.created_at &&
          default_language == o.default_language &&
          id == o.id &&
          layouts == o.layouts &&
          login_url == o.login_url &&
          light_logo_url == o.light_logo_url &&
          dark_logo_url == o.dark_logo_url &&
          name == o.name &&
          hosted == o.hosted &&
          hosted_subdomain == o.hosted_subdomain &&
          id_token_lifetime == o.id_token_lifetime &&
          passage_branding == o.passage_branding &&
          profile_management == o.profile_management &&
          public_signup == o.public_signup &&
          redirect_url == o.redirect_url &&
          refresh_absolute_lifetime == o.refresh_absolute_lifetime &&
          refresh_enabled == o.refresh_enabled &&
          refresh_inactivity_lifetime == o.refresh_inactivity_lifetime &&
          require_email_verification == o.require_email_verification &&
          require_identifier_verification == o.require_identifier_verification &&
          required_identifier == o.required_identifier &&
          role == o.role &&
          rsa_public_key == o.rsa_public_key &&
          secret == o.secret &&
          session_timeout_length == o.session_timeout_length &&
          type == o.type &&
          user_metadata_schema == o.user_metadata_schema &&
          technologies == o.technologies &&
          element_customization == o.element_customization &&
          element_customization_dark == o.element_customization_dark
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [additional_auth_origins, allowed_callback_urls, allowed_identifier, allowed_logout_urls, application_login_uri, auth_fallback_method, auth_fallback_method_ttl, auth_methods, auth_origin, created_at, default_language, id, layouts, login_url, light_logo_url, dark_logo_url, name, hosted, hosted_subdomain, id_token_lifetime, passage_branding, profile_management, public_signup, redirect_url, refresh_absolute_lifetime, refresh_enabled, refresh_inactivity_lifetime, require_email_verification, require_identifier_verification, required_identifier, role, rsa_public_key, secret, session_timeout_length, type, user_metadata_schema, technologies, element_customization, element_customization_dark].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def self._deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = OpenapiClient.const_get(type)
        klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
