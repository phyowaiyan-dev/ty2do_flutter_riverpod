# Release Checklist

Use this checklist before creating a tag or GitHub release.

## Before Release

- [ ] Merge or close all release-critical pull requests
- [ ] Run `flutter analyze`
- [ ] Run `flutter test`
- [ ] Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] Confirm generated files are committed
- [ ] Verify the app opens and the main flow works on at least one target platform
- [ ] Update the version in `pubspec.yaml` if this release should bump the package version
- [ ] Review the README for any setup changes

## Tagging

- [ ] Update or draft release notes
- [ ] Create the git tag
- [ ] Push the tag to `origin`
- [ ] Publish the GitHub release

## After Release

- [ ] Confirm the CI workflow passes on the tag or release branch
- [ ] Watch for bug reports or regressions after release
- [ ] Roll the version forward for the next development cycle if needed
