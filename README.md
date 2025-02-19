# test_app

A Flutter project containing some useful packages.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

###
To access files saved in the external storage of an Android emulator, you can follow these methods:

1. Using Android Studio Device File Explorer
  - Open Android Studio.
  - Run your emulator.
  - Go to View > Tool Windows > Device File Explorer.
  - Navigate to:
    External Storage (Public Storage): /storage/emulated/0/
    App-Specific External Storage: /storage/emulated/0/Android/data/com.yourapp.package/
  - Right-click on the file you need and select "Save As" to download it.