plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android") // correct plugin id for Kotlin DSL
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // Firebase plugin
}

android {
    namespace = "com.example.workmate"
    compileSdk = 35   // was 34
    ndkVersion ="27.0.12077973"
     
    defaultConfig {
        applicationId = "com.example.workmate"
        minSdk = 24
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }
}

