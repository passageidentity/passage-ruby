# frozen_string_literal: true

require_relative 'lib/passageidentity/version'

Gem::Specification.new do |s|
  s.name = 'passageidentity'
  s.version = Passage::VERSION
  s.authors = ['Passage by 1Password']
  s.email = 'support@passage.id'

  s.summary = 'Passage Passkey Complete SDK'
  s.description = 'Passkey Complete for Ruby - Integrate into your Ruby API or service to enable a completely'\
    ' passwordless standalone auth solution with Passage by 1Password.'
  s.homepage = 'http://docs.passage.id/complete'
  s.license = 'MIT'
  s.required_ruby_version = '>= 3.1.6'

  s.metadata['source_code_uri'] = 'https://github.com/passageidentity/passage-ruby'
  s.metadata['changelog_uri'] = 'https://github.com/passageidentity/passage-ruby/CHANGELOG.md'

  s.files = Dir['lib/**/*.rb']
  s.require_path = 'lib'

  s.add_dependency 'activesupport', '~> 7.2', '>= 7.2'
  s.add_dependency 'faraday', '>= 2.12', '< 3.0' # required by codegen
  s.add_dependency 'faraday-multipart', '~> 1.1', '>= 1.1.0' # required by codegen
  s.add_dependency 'jwt', '~> 2.10', '>= 2.10.1'
  s.add_dependency 'marcel',  '~>1.0', '>= 1.0.4' # required by codegen
end
