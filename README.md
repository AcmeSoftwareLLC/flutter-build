# Flutter Build Action

This action builds Flutter artifacts for provided platform. 

## Usage

### Non-Web Build

```yaml
steps:
  - name: Build Android bundle
    uses: AcmeSoftwareLLC/flutter-build@v1
    with:
      platform: android
      build-name: 1.0.0
      build-number: 20231005
      dart-define-file: configs/.env.production
      pub-get: true
      gen-icons: false
```

### Web Build

```yaml
steps:
  - name: Build Web
    uses: AcmeSoftwareLLC/flutter-build@v1
    with:
      platform: web
      base-href: /my-app/
      dart-define-file: configs/.env.production
```