Gem::Specification.new do |s|
    s.name        = 'passage'
    s.version     = '0.0.1'
    s.summary     = "Passage SDK for biometric authentication"
    s.description = "Enables verification of server-side authentication and user management for applications using Passage"
    s.authors     = ["Passage Identity"]
    s.email       = 'support@passage.id'
    s.files       = ["lib/passage.rb"]
    s.homepage    =
      'https://rubygems.org/gems/passage'
    s.license       = 'MIT'

    s.metadata['source_code_uri'] = 'https://github.com/passage-identity/passage-ruby'
  
    # Specify which files should be added to the gem when it is released.
    # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
    s.require_paths = ['lib']
  
    s.add_dependency 'faraday', '>= 0.17.0', '< 2.0'
    s.add_dependency 'jwt', '>= 2.3.0'
    s.add_dependency 'openssl', '>= 3.0.0'
  end