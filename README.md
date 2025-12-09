# Flutter Build with Caching

Build Flutter project with caching of dependencies.

## Usage

```yaml
steps:
  - name: Build Android bundle
    uses: AcmeSoftwareLLC/flutter-build@v2
    with:
      flutter-version: "3.19.6" # optional, specify Flutter version
      flutter-version-file: "example/pubspec.yaml" # optional, specify pubspec.yaml for version
      working-directory: example # optional, defaults to .
      script: flutter build appbundle --release # optional, custom build script
```


## Inputs

| Name                  | Description                                               | Required | Default                |
|-----------------------|-----------------------------------------------------------|----------|------------------------|
| flutter-version       | The Flutter version to use                                | false    | ""                    |
| flutter-version-file  | pubspec.yaml file with Flutter version                    | false    | ""                    |
| working-directory     | Working directory for build                               | false    | .                      |
| script                | Custom build script to run                                | false    |                        |

## Features

- **Caching**: Dependencies are cached for faster builds.
- **Custom Build Script**: Use the `script` input to run any custom build command.

## Example: Custom Build Script

```yaml
steps:
  - name: Build with custom script
    uses: AcmeSoftwareLLC/flutter-build@v2
    with:
      script: flutter build ipa --release --dart-define-from-file=configs/.env.production
```

