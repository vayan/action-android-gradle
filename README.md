[![Docker Build](https://img.shields.io/docker/build/vayan/action-android-gradle.svg)](https://cloud.docker.com/repository/docker/vayan/action-android-gradle/builds)
![Docker Pull](https://img.shields.io/docker/pulls/vayan/action-android-gradle.svg)

# action-android-gradle
Github Action for using Gradle on Android App

![demo](https://user-images.githubusercontent.com/2945291/50053568-be5b6300-0137-11e9-86f2-e6df9167c2fe.png)

# Usage

```hcl
workflow "Build and test on push" {
  on = "push"
  resolves = [
    "Run tests with gradle",
    "Build Debug APK",
  ]
}

action "Run tests with gradle" {
  uses = "vayan/action-android-gradle@master"
  args = "test"
}

action "Build Debug APK" {
  uses = "vayan/action-android-gradle@master"
  args = "assembleDebug"
}
```
