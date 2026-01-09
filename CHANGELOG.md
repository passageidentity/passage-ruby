# Changelog

All notable changes to this project will be documented in this file.

## [1.0.3](https://github.com/passageidentity/passage-ruby/compare/v1.0.2...v1.0.3) (2026-01-09)


### Documentation

* add sunset notice to README ([#178](https://github.com/passageidentity/passage-ruby/issues/178)) ([18cf380](https://github.com/passageidentity/passage-ruby/commit/18cf380fc7d8658093d5758af92baff333ba4d47))

## [1.0.2](https://github.com/passageidentity/passage-ruby/compare/v1.0.1...v1.0.2) (2025-04-29)


### Bug Fixes

* PassageError class is now correctly imported in the auth and user classes ([#176](https://github.com/passageidentity/passage-ruby/issues/176)) ([42e894a](https://github.com/passageidentity/passage-ruby/commit/42e894a81dbded6323a8643352353dd108a5bb91))

## [1.0.1](https://github.com/passageidentity/passage-ruby/compare/v1.0.0...v1.0.1) (2025-04-02)


### Bug Fixes

* Bump `activesupport` dependency version to accommodate Rails 8 apps ([531984e](https://github.com/passageidentity/passage-ruby/commit/531984e85fb9385587c7ee31273a2b465124cdec))

## [1.0.0](https://github.com/passageidentity/passage-ruby/compare/v0.7.1...v1.0.0) (2025-01-14)


### ⚠ BREAKING CHANGES

* remove deprecated AppInfo code from codegen ([#144](https://github.com/passageidentity/passage-ruby/issues/144))
* return void instead of boolean for `Passage.user.delete`
* require kwargs for validate_jwt and magic link methods
* update deprecated user method signatures ([#159](https://github.com/passageidentity/passage-ruby/issues/159))
* changes the constructor signatures for the client, auth, and user classes
* remove deprecated client, auth, and user methods

### Features

* add parameter guard for language in magic link options ([#165](https://github.com/passageidentity/passage-ruby/issues/165)) ([a1ce3e7](https://github.com/passageidentity/passage-ruby/commit/a1ce3e72409d7602db9b0ec5619a82fe022e4448))
* changes the constructor signatures for the client, auth, and user classes ([111431e](https://github.com/passageidentity/passage-ruby/commit/111431ee28195c9589663baa70cdbe9b928dc2ee))
* remove deprecated AppInfo code from codegen ([#144](https://github.com/passageidentity/passage-ruby/issues/144)) ([4075193](https://github.com/passageidentity/passage-ruby/commit/4075193242dceaa46c882e5fe23aec9edc8027c9))
* remove deprecated client, auth, and user methods ([c49fe3a](https://github.com/passageidentity/passage-ruby/commit/c49fe3aa25080eb18b8d0b918a2ca2d51c6088fe))
* require kwargs for validate_jwt and magic link methods ([ba6bed9](https://github.com/passageidentity/passage-ruby/commit/ba6bed999064d03e2cd404c38643ef0c3317e6c2))
* return void instead of boolean for `Passage.user.delete` ([c6b5746](https://github.com/passageidentity/passage-ruby/commit/c6b5746506a8758c7d41a6fef0b204e35663ba9a))
* update deprecated user method signatures ([#159](https://github.com/passageidentity/passage-ruby/issues/159)) ([a6faeba](https://github.com/passageidentity/passage-ruby/commit/a6faeba292675a6f4340cbd9b245bbc037b8e5f5))
* update minimum required ruby version to 3.1.6 ([#162](https://github.com/passageidentity/passage-ruby/issues/162)) ([7da23ec](https://github.com/passageidentity/passage-ruby/commit/7da23ecc852106ee2b9fcaa2d5bb7fb1897d07f1))


### Bug Fixes

* adds error handling for OpenApi errors ([#166](https://github.com/passageidentity/passage-ruby/issues/166)) ([827bc5c](https://github.com/passageidentity/passage-ruby/commit/827bc5ceefab5270d76073879ead423fce88bb8b))

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
