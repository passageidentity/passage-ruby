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
  s.required_ruby_version = '>= 3.1.3'

  s.metadata['source_code_uri'] = 'https://github.com/passageidentity/passage-ruby'
  s.metadata['changelog_uri'] = 'https://github.com/passageidentity/passage-ruby/CHANGELOG.md'

  s.files = Dir['lib/**/*.rb']
  s.require_path = 'lib'

  s.add_dependency 'faraday', '>= 0.17.0', '< 2.0'
  s.add_dependency 'jwt', '~> 2.3', '>= 2.3.0'
  s.add_dependency 'openssl', '~> 3.0', '>= 3.0.0'
end
