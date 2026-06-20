# ty2do_flutter_riverpod

[![CI](https://github.com/phyowaiyan-dev/ty2do_flutter_riverpod/actions/workflows/ci.yml/badge.svg)](https://github.com/phyowaiyan-dev/ty2do_flutter_riverpod/actions/workflows/ci.yml)
[![License](https://img.shields.io/github/license/phyowaiyan-dev/ty2do_flutter_riverpod)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-ready-02569B?logo=flutter&logoColor=white)](https://flutter.dev)

A Flutter todo app built with Riverpod, code generation, and a feature-first structure.

## What This Project Includes

- Riverpod-powered state management
- Generated provider code with `riverpod_annotation` and `riverpod_generator`
- Feature-first folder structure for todos
- Ready-to-use OSS community files and GitHub templates

## Project Structure

- `lib/features/todos/domain` - todo models
- `lib/features/todos/application` - Riverpod controllers and app state
- `lib/features/todos/presentation` - UI widgets and pages

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- A device, emulator, or browser target

### Install

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

### Generate Riverpod code

```bash
dart run build_runner build --delete-conflicting-outputs
```

For continuous generation while you edit:

```bash
dart run build_runner watch
```

### Run checks

```bash
flutter analyze
flutter test
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

## Security

If you find a security issue, follow [SECURITY.md](SECURITY.md) instead of posting exploit details in a public issue.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).

## Release Checklist

Before tagging a release, review [RELEASE_CHECKLIST.md](RELEASE_CHECKLIST.md).
