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
  class ElementCustomization
    # Container background color in hex. Default is `#ffffff` in light mode & `#383838` in dark mode. 
    attr_accessor :passage_container_background_color

    # Maximum width of container (px)
    attr_accessor :passage_container_max_width

    # Input box background color in hex. Default is `#ffffff` in light mode & `#4b4b4b` in dark mode. 
    attr_accessor :passage_input_box_background_color

    # Input box border radius (px)
    attr_accessor :passage_input_box_border_radius

    attr_accessor :passage_header_font_family

    attr_accessor :passage_body_font_family

    # Header text color in hex. Default is `#222222` in light mode & `#f3f3f3` in dark mode. 
    attr_accessor :passage_header_text_color

    # Body text color in hex. Default is `#222222` in light mode & `#f3f3f3` in dark mode. 
    attr_accessor :passage_body_text_color

    # Primary button background colour (hex)
    attr_accessor :passage_primary_button_background_color

    # Primary button font colour (hex)
    attr_accessor :passage_primary_button_text_color

    # Primary button background on hover (hex)
    attr_accessor :passage_primary_button_hover_color

    # Primary button border radius (px)
    attr_accessor :passage_primary_button_border_radius

    # Primary button border color
    attr_accessor :passage_primary_button_border_color

    # Primary button border width (px)
    attr_accessor :passage_primary_button_border_width

    # Secondary button background colour (hex)
    attr_accessor :passage_secondary_button_background_color

    # Secondary button font colour (hex)
    attr_accessor :passage_secondary_button_text_color

    # Secondary button background on hover (hex)
    attr_accessor :passage_secondary_button_hover_color

    # Secondary button border radius (px)
    attr_accessor :passage_secondary_button_border_radius

    # Secondary button border color
    attr_accessor :passage_secondary_button_border_color

    # Secondary button border width (px)
    attr_accessor :passage_secondary_button_border_width

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
        :'passage_container_background_color' => :'passage_container_background_color',
        :'passage_container_max_width' => :'passage_container_max_width',
        :'passage_input_box_background_color' => :'passage_input_box_background_color',
        :'passage_input_box_border_radius' => :'passage_input_box_border_radius',
        :'passage_header_font_family' => :'passage_header_font_family',
        :'passage_body_font_family' => :'passage_body_font_family',
        :'passage_header_text_color' => :'passage_header_text_color',
        :'passage_body_text_color' => :'passage_body_text_color',
        :'passage_primary_button_background_color' => :'passage_primary_button_background_color',
        :'passage_primary_button_text_color' => :'passage_primary_button_text_color',
        :'passage_primary_button_hover_color' => :'passage_primary_button_hover_color',
        :'passage_primary_button_border_radius' => :'passage_primary_button_border_radius',
        :'passage_primary_button_border_color' => :'passage_primary_button_border_color',
        :'passage_primary_button_border_width' => :'passage_primary_button_border_width',
        :'passage_secondary_button_background_color' => :'passage_secondary_button_background_color',
        :'passage_secondary_button_text_color' => :'passage_secondary_button_text_color',
        :'passage_secondary_button_hover_color' => :'passage_secondary_button_hover_color',
        :'passage_secondary_button_border_radius' => :'passage_secondary_button_border_radius',
        :'passage_secondary_button_border_color' => :'passage_secondary_button_border_color',
        :'passage_secondary_button_border_width' => :'passage_secondary_button_border_width'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'passage_container_background_color' => :'String',
        :'passage_container_max_width' => :'Integer',
        :'passage_input_box_background_color' => :'String',
        :'passage_input_box_border_radius' => :'Integer',
        :'passage_header_font_family' => :'FontFamily',
        :'passage_body_font_family' => :'FontFamily',
        :'passage_header_text_color' => :'String',
        :'passage_body_text_color' => :'String',
        :'passage_primary_button_background_color' => :'String',
        :'passage_primary_button_text_color' => :'String',
        :'passage_primary_button_hover_color' => :'String',
        :'passage_primary_button_border_radius' => :'Integer',
        :'passage_primary_button_border_color' => :'String',
        :'passage_primary_button_border_width' => :'Integer',
        :'passage_secondary_button_background_color' => :'String',
        :'passage_secondary_button_text_color' => :'String',
        :'passage_secondary_button_hover_color' => :'String',
        :'passage_secondary_button_border_radius' => :'Integer',
        :'passage_secondary_button_border_color' => :'String',
        :'passage_secondary_button_border_width' => :'Integer'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `OpenapiClient::ElementCustomization` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `OpenapiClient::ElementCustomization`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'passage_container_background_color')
        self.passage_container_background_color = attributes[:'passage_container_background_color']
      end

      if attributes.key?(:'passage_container_max_width')
        self.passage_container_max_width = attributes[:'passage_container_max_width']
      else
        self.passage_container_max_width = 300
      end

      if attributes.key?(:'passage_input_box_background_color')
        self.passage_input_box_background_color = attributes[:'passage_input_box_background_color']
      end

      if attributes.key?(:'passage_input_box_border_radius')
        self.passage_input_box_border_radius = attributes[:'passage_input_box_border_radius']
      else
        self.passage_input_box_border_radius = 5
      end

      if attributes.key?(:'passage_header_font_family')
        self.passage_header_font_family = attributes[:'passage_header_font_family']
      else
        self.passage_header_font_family = 'Helvetica'
      end

      if attributes.key?(:'passage_body_font_family')
        self.passage_body_font_family = attributes[:'passage_body_font_family']
      else
        self.passage_body_font_family = 'Helvetica'
      end

      if attributes.key?(:'passage_header_text_color')
        self.passage_header_text_color = attributes[:'passage_header_text_color']
      end

      if attributes.key?(:'passage_body_text_color')
        self.passage_body_text_color = attributes[:'passage_body_text_color']
      end

      if attributes.key?(:'passage_primary_button_background_color')
        self.passage_primary_button_background_color = attributes[:'passage_primary_button_background_color']
      else
        self.passage_primary_button_background_color = '#121212'
      end

      if attributes.key?(:'passage_primary_button_text_color')
        self.passage_primary_button_text_color = attributes[:'passage_primary_button_text_color']
      else
        self.passage_primary_button_text_color = '#f3f3f3'
      end

      if attributes.key?(:'passage_primary_button_hover_color')
        self.passage_primary_button_hover_color = attributes[:'passage_primary_button_hover_color']
      else
        self.passage_primary_button_hover_color = '#4d4d4d'
      end

      if attributes.key?(:'passage_primary_button_border_radius')
        self.passage_primary_button_border_radius = attributes[:'passage_primary_button_border_radius']
      else
        self.passage_primary_button_border_radius = 5
      end

      if attributes.key?(:'passage_primary_button_border_color')
        self.passage_primary_button_border_color = attributes[:'passage_primary_button_border_color']
      else
        self.passage_primary_button_border_color = '#121212'
      end

      if attributes.key?(:'passage_primary_button_border_width')
        self.passage_primary_button_border_width = attributes[:'passage_primary_button_border_width']
      else
        self.passage_primary_button_border_width = 0
      end

      if attributes.key?(:'passage_secondary_button_background_color')
        self.passage_secondary_button_background_color = attributes[:'passage_secondary_button_background_color']
      else
        self.passage_secondary_button_background_color = '#ffffff'
      end

      if attributes.key?(:'passage_secondary_button_text_color')
        self.passage_secondary_button_text_color = attributes[:'passage_secondary_button_text_color']
      else
        self.passage_secondary_button_text_color = '#222222'
      end

      if attributes.key?(:'passage_secondary_button_hover_color')
        self.passage_secondary_button_hover_color = attributes[:'passage_secondary_button_hover_color']
      else
        self.passage_secondary_button_hover_color = '#d7d7d7'
      end

      if attributes.key?(:'passage_secondary_button_border_radius')
        self.passage_secondary_button_border_radius = attributes[:'passage_secondary_button_border_radius']
      else
        self.passage_secondary_button_border_radius = 5
      end

      if attributes.key?(:'passage_secondary_button_border_color')
        self.passage_secondary_button_border_color = attributes[:'passage_secondary_button_border_color']
      else
        self.passage_secondary_button_border_color = '#d7d7d7'
      end

      if attributes.key?(:'passage_secondary_button_border_width')
        self.passage_secondary_button_border_width = attributes[:'passage_secondary_button_border_width']
      else
        self.passage_secondary_button_border_width = 1
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          passage_container_background_color == o.passage_container_background_color &&
          passage_container_max_width == o.passage_container_max_width &&
          passage_input_box_background_color == o.passage_input_box_background_color &&
          passage_input_box_border_radius == o.passage_input_box_border_radius &&
          passage_header_font_family == o.passage_header_font_family &&
          passage_body_font_family == o.passage_body_font_family &&
          passage_header_text_color == o.passage_header_text_color &&
          passage_body_text_color == o.passage_body_text_color &&
          passage_primary_button_background_color == o.passage_primary_button_background_color &&
          passage_primary_button_text_color == o.passage_primary_button_text_color &&
          passage_primary_button_hover_color == o.passage_primary_button_hover_color &&
          passage_primary_button_border_radius == o.passage_primary_button_border_radius &&
          passage_primary_button_border_color == o.passage_primary_button_border_color &&
          passage_primary_button_border_width == o.passage_primary_button_border_width &&
          passage_secondary_button_background_color == o.passage_secondary_button_background_color &&
          passage_secondary_button_text_color == o.passage_secondary_button_text_color &&
          passage_secondary_button_hover_color == o.passage_secondary_button_hover_color &&
          passage_secondary_button_border_radius == o.passage_secondary_button_border_radius &&
          passage_secondary_button_border_color == o.passage_secondary_button_border_color &&
          passage_secondary_button_border_width == o.passage_secondary_button_border_width
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [passage_container_background_color, passage_container_max_width, passage_input_box_background_color, passage_input_box_border_radius, passage_header_font_family, passage_body_font_family, passage_header_text_color, passage_body_text_color, passage_primary_button_background_color, passage_primary_button_text_color, passage_primary_button_hover_color, passage_primary_button_border_radius, passage_primary_button_border_color, passage_primary_button_border_width, passage_secondary_button_background_color, passage_secondary_button_text_color, passage_secondary_button_hover_color, passage_secondary_button_border_radius, passage_secondary_button_border_color, passage_secondary_button_border_width].hash
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
