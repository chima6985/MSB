# Masoyinbo

Create local .env file using stg.env as template e.g. stg.env, prod.env, in the project's asset directory
NB: Make sure created .env file is gitignored

To switch between environments (dev and production), specify relevant .env class in env/env.dart
```dart
static Env _getEnv() => StgEnv();
```
Project relies heavily on build runner for - images, assets, models
```dart
  make codegen-build || make codegen-watch;
```

```Run
  make + [cmd] in the make file;
```

- Run app
  flutter run

- Build apk
  make build-apk

- Build appbundle
  make build-app-bundle

- Build ipa
  flutter build ipa --build-name="1.x.x" --build-number="1"

Router - [GoRouter](https://pub.dev/packages/go_router)
State management - [Bloc](https://pub.dev/packages/flutter_bloc)
Build generator - [Freezed](https://pub.dev/packages/freezed)
Networking - [Http](https://pub.dev/packages/http)

Integrations
Firebase - [Link](https://firebase.google.com/docs/flutter/setup?platform=ios)