Gem::Specification.new do |s|
  s.name = 'passageidentity'
  s.version = '0.1.1'
  s.summary = 'Passage SDK for biometric authentication'
  s.description =
    'Enables verification of server-side authentication and user management for applications using Passage'
  s.authors = ['Passage Identity']
  s.email = 'support@passage.id'
  s.files = ['lib/passageidentity.rb']
  s.homepage = 'https://rubygems.org/gems/passageidentity'
  s.license = 'MIT'

  s.metadata['source_code_uri'] =
    'https://github.com/passage-identity/passage-ruby'

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
  s.add_dependency 'jwt', '>= 2.3.0'
  s.add_dependency 'openssl', '>= 3.0.0'
  s.add_dependency 'dotenv', '>= 2.7.6'
end
