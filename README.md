# flutter-add-to-app
Demo project to integrate Flutter on iOS and Android via “add-to-app”

# Android Build and Run
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
2. open counter_android in Android Studio and build and run

# iOS Build and Run
1. move to counter_ios directory and run pod install on shell
```
~counter_ios % pod install
Analyzing dependencies
Downloading dependencies
Installing Flutter (1.0.0)
Installing FlutterPluginRegistrant (0.0.1)
Generating Pods project
Integrating client project

[!] Please close any current Xcode sessions and use `counter_ios.xcworkspace` for this project from now on.
Pod installation complete! There are 2 dependencies from the Podfile and 2 total pods installed.
~counter_ios % ls -ll
total 16
-rw-r--r--  1 cody  staff  516  7 22 13:44 Podfile
-rw-r--r--  1 cody  staff  621  7 22 13:46 Podfile.lock
drwxr-xr-x  7 cody  staff  224  7 22 13:46 Pods
drwxr-xr-x  6 cody  staff  192  7 22 13:46 counter_ios
drwxr-xr-x  5 cody  staff  160  7 22 13:46 counter_ios.xcodeproj
drwxr-xr-x  3 cody  staff   96  7 22 13:46 counter_ios.xcworkspace
```
2. open counter_ios.xcworkspace and build and run
