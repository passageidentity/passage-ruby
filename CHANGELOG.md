# Changelog

All notable changes to this project will be documented in this file.

## [0.8.0](https://github.com/passageidentity/passage-ruby/compare/v0.7.1...v0.8.0) (2024-12-20)


### Features

* add new class and method names ([4515ac6](https://github.com/passageidentity/passage-ruby/commit/4515ac647530d193450939e4d727c146c7c970b5))
* add parameter guards ([#116](https://github.com/passageidentity/passage-ruby/issues/116)) ([ce5c590](https://github.com/passageidentity/passage-ruby/commit/ce5c59064f1f223c34121acf1b8c8f99cba4acc2))
* **codegen:** create magic link request fields are now optional ([#113](https://github.com/passageidentity/passage-ruby/issues/113)) ([f04af7b](https://github.com/passageidentity/passage-ruby/commit/f04af7bef874db3aba57c1541cc27210313da997))
* jwks caching with ActiveSupport ([#111](https://github.com/passageidentity/passage-ruby/issues/111)) ([34df698](https://github.com/passageidentity/passage-ruby/commit/34df6989e0f793e8a1cf7b81576ebaf3a2c84f98))
* reworks the new create magic link func into three separate functions ([#121](https://github.com/passageidentity/passage-ruby/issues/121)) ([10c9870](https://github.com/passageidentity/passage-ruby/commit/10c98703a8beda1380fae88bb930a4eb3ed5765b))
* support jwt aud validation for hosted apps ([#117](https://github.com/passageidentity/passage-ruby/issues/117)) ([bcaaebe](https://github.com/passageidentity/passage-ruby/commit/bcaaebe987d9e94d6c79a86261db8e56156b91dc))


### Bug Fixes

* jwt validation correctly compares the aud with both app id and auth origin ([#147](https://github.com/passageidentity/passage-ruby/issues/147)) ([8b03140](https://github.com/passageidentity/passage-ruby/commit/8b031405acb9905479f3a65c836083b845f8113e))
* name is now consistent with the others ([#63](https://github.com/passageidentity/passage-ruby/issues/63)) ([cc5965b](https://github.com/passageidentity/passage-ruby/commit/cc5965b7aa4d5f3341e30deab74ac7a4c4b961ff))
* use `Passage::VERSION` instead of parsing gemspec ([1e2d1e2](https://github.com/passageidentity/passage-ruby/commit/1e2d1e2dcd2deb846394d26d2436e9bd6da01663))
* validate_jwt now refreshes cache if it is expired after client initialization ([#145](https://github.com/passageidentity/passage-ruby/issues/145)) ([eef1230](https://github.com/passageidentity/passage-ruby/commit/eef1230285af8e3c9d1f1eedfdc1332575e98ee3))

## [0.7.1](https://github.com/passageidentity/passage-ruby/compare/v0.7.0...v0.7.1) (2024-12-20)


### Bug Fixes

* jwt validation correctly compares the aud with both app id and auth origin ([#147](https://github.com/passageidentity/passage-ruby/issues/147)) ([8b03140](https://github.com/passageidentity/passage-ruby/commit/8b031405acb9905479f3a65c836083b845f8113e))
* validate_jwt now refreshes cache if it is expired after client initialization ([#145](https://github.com/passageidentity/passage-ruby/issues/145)) ([eef1230](https://github.com/passageidentity/passage-ruby/commit/eef1230285af8e3c9d1f1eedfdc1332575e98ee3))

## [0.7.0](https://github.com/passageidentity/passage-ruby/compare/v0.6.2...v0.7.0) (2024-12-12)


### Features

* add new class and method names ([4515ac6](https://github.com/passageidentity/passage-ruby/commit/4515ac647530d193450939e4d727c146c7c970b5))
* add parameter guards ([#116](https://github.com/passageidentity/passage-ruby/issues/116)) ([ce5c590](https://github.com/passageidentity/passage-ruby/commit/ce5c59064f1f223c34121acf1b8c8f99cba4acc2))
* **codegen:** create magic link request fields are now optional ([#113](https://github.com/passageidentity/passage-ruby/issues/113)) ([f04af7b](https://github.com/passageidentity/passage-ruby/commit/f04af7bef874db3aba57c1541cc27210313da997))
* jwks caching with ActiveSupport ([#111](https://github.com/passageidentity/passage-ruby/issues/111)) ([34df698](https://github.com/passageidentity/passage-ruby/commit/34df6989e0f793e8a1cf7b81576ebaf3a2c84f98))
* reworks the new create magic link func into three separate functions ([#121](https://github.com/passageidentity/passage-ruby/issues/121)) ([10c9870](https://github.com/passageidentity/passage-ruby/commit/10c98703a8beda1380fae88bb930a4eb3ed5765b))
* support jwt aud validation for hosted apps ([#117](https://github.com/passageidentity/passage-ruby/issues/117)) ([bcaaebe](https://github.com/passageidentity/passage-ruby/commit/bcaaebe987d9e94d6c79a86261db8e56156b91dc))

## [0.6.2] - 2024-10-22

### Changed

- Update to the new README template, updated license, updated metadata in gemspec file

## [0.6.1] - 2024-09-26

### Changed

- Updated documentation links to point to new documentation

## [0.6.0] - 2024-03-21

### Added

- `GetUserByIdentifier` method has been added
- `ListPaginatedUsersItem` model has been added

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
