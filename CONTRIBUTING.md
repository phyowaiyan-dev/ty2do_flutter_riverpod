# Contributing

Thanks for helping improve `ty2do_flutter_riverpod`.

## Setup

1. Install the Flutter SDK.
2. Run `flutter pub get`.
3. Run `dart run build_runner build --delete-conflicting-outputs` if you change Riverpod annotated files.
4. Run `flutter analyze` and `flutter test` before opening a pull request.

## Branching

Use short, focused branch names.

- `feat/<short-description>`
- `fix/<short-description>`
- `docs/<short-description>`
- `chore/<short-description>`

Keep changes small and scoped to one concern whenever possible.

## Pull Requests

1. Open a branch from `main`.
2. Link the related issue when applicable.
3. Describe the user-facing change and any tradeoffs.
4. Include screenshots or screen recordings for UI changes.
5. Make sure generated files are committed when codegen output changes.

## Code Style

- Follow the existing Flutter and Riverpod patterns in the repo.
- Prefer clear names over clever shortcuts.
- Keep widget trees readable and easy to scan.

## Review Checklist

- `flutter analyze` passes.
- `flutter test` passes.
- Generated Riverpod files are up to date.
- The change is documented if it affects setup or behavior.

## GitHub Settings To Enable

To finish the OSS setup, turn on branch protection and repository features in GitHub:

- Protect `main` with required pull requests.
- Require at least one approving review before merge.
- Require status checks from the CI workflow.
- Require branches to be up to date before merging if you want stricter review gates.
- Enable code owner review if you want `CODEOWNERS` enforced.
- Enable private vulnerability reporting in the Security tab.
