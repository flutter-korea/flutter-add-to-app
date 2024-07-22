# flutter-add-to-app
Demo project to integrate Flutter on iOS and Android via “add-to-app”

# Android 실행
1. counter_module에서 aar 빌드
```
~counter_module % fvm flutter pub get
Resolving dependencies... 
Downloading packages... 
  collection 1.18.0 (1.19.0 available)
  leak_tracker 10.0.4 (10.0.5 available)
  leak_tracker_flutter_testing 3.0.3 (3.0.5 available)
  material_color_utilities 0.8.0 (0.12.0 available)
  meta 1.12.0 (1.15.0 available)
  string_scanner 1.2.0 (1.3.0 available)
  test_api 0.7.0 (0.7.3 available)
  vm_service 14.2.1 (14.2.4 available)
Got dependencies!
8 packages have newer versions incompatible with dependency constraints.
Try `flutter pub outdated` for more information.

~counter_module % fvm flutter build aar

Running Gradle task 'assembleAarDebug'...                        1,943ms
✓ Built build/host/outputs/repo
Running Gradle task 'assembleAarProfile'...                      1,287ms
✓ Built build/host/outputs/repo
Running Gradle task 'assembleAarRelease'...                      1,260ms
✓ Built build/host/outputs/repo

Consuming the Module
  1. Open <host>/app/build.gradle
  2. Ensure you have the repositories configured, otherwise add them:

      String storageUrl = System.env.FLUTTER_STORAGE_BASE_URL ?: "https://storage.googleapis.com"
      repositories {
        maven {
            url '/Users/cody/flutter-add-to-app/counter_module/build/host/outputs/repo'
        }
        maven {
            url "$storageUrl/download.flutter.io"
        }
      }

  3. Make the host app depend on the Flutter module:

    dependencies {
      debugImplementation 'org.flutterseoul.counter_module:flutter_debug:1.0'
      profileImplementation 'org.flutterseoul.counter_module:flutter_profile:1.0'
      releaseImplementation 'org.flutterseoul.counter_module:flutter_release:1.0'
    }


  4. Add the `profile` build type:

    android {
      buildTypes {
        profile {
          initWith debug
        }
      }
    }

To learn more, visit https://flutter.dev/go/build-aar
```
2. counter_android에서 안드로이드 실행
