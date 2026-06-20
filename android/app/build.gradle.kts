plugins {
    id("com.android.application")
    id("com.google.gms.google-services")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "io.github.hayatuk.hayatuk"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "io.github.hayatuk.hayatuk"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    // Per-environment builds. The google-services plugin auto-selects the
    // matching config from src/<flavor>/google-services.json, so FCM and the
    // native Firebase app bind to the right project at build time.
    // Build/run with e.g. `--flavor dev --dart-define=ENV=dev`.
    flavorDimensions += "env"
    productFlavors {
        create("dev") {
            dimension = "env"
            // No applicationId suffix: keeps the existing dev Firebase Android
            // app registration (package io.github.hayatuk.hayatuk) valid.
            // Add `applicationIdSuffix = ".dev"` if you want dev + prod
            // installed side by side — but then re-register that package in the
            // dev Firebase project and re-download its google-services.json.
        }
        create("prod") {
            dimension = "env"
        }
    }
}

flutter {
    source = "../.."
}
