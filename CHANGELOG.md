# Changelog

All notable changes to this project will be documented in this file.

## [0.5.0] - 2024-01-30

### Added

- `AppleUserSocialConnection` model has been added

### Changed

- `UserEventInfo` has been renamed to `UserRecentEvent`
- Docs have been moved to `/docs`
- `GithubSocialConnection` has been renamed to `GithubUserSocialConnection`
- `GoogleSocialConnection` has been renamed to `GoogleUserSocialConnection`

## [0.4.0] - 2024-01-18

### Added

- The `UserInfo` class has a new `'social_connections' =>:'UserSocialConnections'` field for GitHub and Google

## [0.3.0] - 2023-12-06

### Added

- Generate types and api calls with openapi generator.
- Version constant instead of parsing gemspec.


### Deprecate

- `user.signout()` -> `auth.revoke_user_refresh_tokens()`
- `auth.authenticate_request()` -> `auth.validate_jwt()`


### Possible Breaking Changes

- Types are now generated. Previous type names may have changed. [See documentation](https://github.com/passageidentity/passage-ruby/tree/main/docs/generated) for model definitions.
