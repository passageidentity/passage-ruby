# OpenapiClient::ElementCustomization

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **passage_container_background_color** | **String** | Container background color in hex. Default is &#x60;#ffffff&#x60; in light mode &amp; &#x60;#383838&#x60; in dark mode.  | [optional] |
| **passage_container_max_width** | **Integer** | Maximum width of container (px) | [optional][default to 300] |
| **passage_input_box_background_color** | **String** | Input box background color in hex. Default is &#x60;#ffffff&#x60; in light mode &amp; &#x60;#4b4b4b&#x60; in dark mode.  | [optional] |
| **passage_input_box_border_radius** | **Integer** | Input box border radius (px) | [optional][default to 5] |
| **passage_header_font_family** | [**FontFamily**](FontFamily.md) |  | [optional][default to &#39;Helvetica&#39;] |
| **passage_body_font_family** | [**FontFamily**](FontFamily.md) |  | [optional][default to &#39;Helvetica&#39;] |
| **passage_header_text_color** | **String** | Header text color in hex. Default is &#x60;#222222&#x60; in light mode &amp; &#x60;#f3f3f3&#x60; in dark mode.  | [optional] |
| **passage_body_text_color** | **String** | Body text color in hex. Default is &#x60;#222222&#x60; in light mode &amp; &#x60;#f3f3f3&#x60; in dark mode.  | [optional] |
| **passage_primary_button_background_color** | **String** | Primary button background colour (hex) | [optional][default to &#39;#121212&#39;] |
| **passage_primary_button_text_color** | **String** | Primary button font colour (hex) | [optional][default to &#39;#f3f3f3&#39;] |
| **passage_primary_button_hover_color** | **String** | Primary button background on hover (hex) | [optional][default to &#39;#4d4d4d&#39;] |
| **passage_primary_button_border_radius** | **Integer** | Primary button border radius (px) | [optional][default to 5] |
| **passage_primary_button_border_color** | **String** | Primary button border color | [optional][default to &#39;#121212&#39;] |
| **passage_primary_button_border_width** | **Integer** | Primary button border width (px) | [optional][default to 0] |
| **passage_secondary_button_background_color** | **String** | Secondary button background colour (hex) | [optional][default to &#39;#ffffff&#39;] |
| **passage_secondary_button_text_color** | **String** | Secondary button font colour (hex) | [optional][default to &#39;#222222&#39;] |
| **passage_secondary_button_hover_color** | **String** | Secondary button background on hover (hex) | [optional][default to &#39;#d7d7d7&#39;] |
| **passage_secondary_button_border_radius** | **Integer** | Secondary button border radius (px) | [optional][default to 5] |
| **passage_secondary_button_border_color** | **String** | Secondary button border color | [optional][default to &#39;#d7d7d7&#39;] |
| **passage_secondary_button_border_width** | **Integer** | Secondary button border width (px) | [optional][default to 1] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ElementCustomization.new(
  passage_container_background_color: #ffffff,
  passage_container_max_width: null,
  passage_input_box_background_color: #ffffff,
  passage_input_box_border_radius: null,
  passage_header_font_family: null,
  passage_body_font_family: null,
  passage_header_text_color: #222222,
  passage_body_text_color: #222222,
  passage_primary_button_background_color: null,
  passage_primary_button_text_color: null,
  passage_primary_button_hover_color: null,
  passage_primary_button_border_radius: null,
  passage_primary_button_border_color: null,
  passage_primary_button_border_width: null,
  passage_secondary_button_background_color: null,
  passage_secondary_button_text_color: null,
  passage_secondary_button_hover_color: null,
  passage_secondary_button_border_radius: null,
  passage_secondary_button_border_color: null,
  passage_secondary_button_border_width: null
)
```

