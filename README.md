
# 🚀 Flutter Build with Caching

Easily build your Flutter project with blazing fast dependency caching! 🏗️✨


## 🚦 Quick Start

Add this action to your workflow to build and cache your Flutter project:

```yaml
steps:
  - name: Build Android bundle
    uses: AcmeSoftwareLLC/flutter-build@v2
    with:
      flutter-version: "3.19.6"         # 🐦 Optional: Flutter version
      flutter-version-file: "example/pubspec.yaml" # 📄 Optional: pubspec.yaml for version
      working-directory: example         # 📁 Optional: defaults to .
      script: flutter build appbundle --release # 🛠️ Optional: custom build script
```



---

## ⚙️ Inputs

| Name                  | Description                                               | Required | Default                |
|-----------------------|-----------------------------------------------------------|----------|------------------------|
| 🐦 flutter-version       | The Flutter version to use                                | false    | ""                    |
| 📄 flutter-version-file  | pubspec.yaml file with Flutter version                    | false    | ""                    |
| 📁 working-directory     | Working directory for build                               | false    | .                      |
| 🛠️ script                | Custom build script to run                                | false    |                        |


---

## 🌟 Features

- ⚡ **Caching**: Dependencies are cached for faster builds.
- 🛠️ **Custom Build Script**: Use the `script` input to run any custom build command.


---

## 📝 Example: Custom Build Script

```yaml
steps:
  - name: Build with custom script
    uses: AcmeSoftwareLLC/flutter-build@v2
    with:
      script: flutter build ipa --release --dart-define-from-file=configs/.env.production
```

---

## 📚 More Info

- See [`action.yml`](./action.yml) for all available options.
- Supports Android, iOS, Web, and more!
- Maintained by AcmeSoftwareLLC.

---

Happy building! 🎉

