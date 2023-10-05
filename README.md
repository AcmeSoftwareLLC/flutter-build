# Flutter Build Action

This action builds Flutter artifacts for provided platform. 

## Usage

```yaml
steps:
  - name: Build Android bundle
    uses: AcmeSoftwareLLC/flutter-build@v1
    with:
      platform: android
      build-name: 1.0.0
      build-number: 20231005
```