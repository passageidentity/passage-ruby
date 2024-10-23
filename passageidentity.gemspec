require_relative 'lib/passageidentity/version'

Gem::Specification.new do |s|
  s.name = 'passageidentity'
  s.version = Passage::VERSION
  s.summary = 'Passage Passkey Complete SDK'
  s.description =
    'Passkey Complete for Ruby - Integrate into your Ruby API or service to enable a completely passwordless standalone auth solution with Passage by 1Password.'
  s.authors = ['Passage by 1Password']
  s.email = 'support@passage.id'
  s.files = ['lib/passageidentity.rb']
  s.homepage = 'http://docs.passage.id/complete'
  s.license = 'MIT'

  s.metadata['source_code_uri'] =
    'https://github.com/passageidentity/passage-ruby'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.require_paths = ['lib']

  s.files =
    Dir.chdir(File.expand_path(__dir__)) do
      `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
      end
    end

  s.add_dependency 'faraday', '>= 0.17.0', '< 2.0'
  s.add_dependency 'jwt', '~> 2.3', '>= 2.3.0'
  s.add_dependency 'openssl', '~> 3.0', '>= 3.0.0'
end
