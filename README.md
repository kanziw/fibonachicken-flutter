# fibonachicken-flutter

> https://github.com/kanziw/fibonachicken

- Inspired by https://fibonachicken.herokuapp.com/
- favicon reference: https://favicon.io/emoji-favicons/chicken/


## Getting Started

1. Project Setup

```sh
# https://brew.sh/
$ brew bundle
$ task
```


## Publish

> https://docs.flutter.dev/deployment/cd#fastlane

### Android

Android build & publish를 위한 `kye.properties`, `upload-keystore.jks` 및 `pc-api-xxx.json` file들은 별도로 보관하고 있으며, 모두 android/ directory에 따로 복사해주어야 합니다.

```sh
$ task build:android
# "Google Api Error: Invalid request - APK specifies a version code that has already been used" 가 발생하고 있음
# [pubspec.yaml](./pubspec.yaml)의 설명을 참고하여 build해야 함
$ task publish:android
```
