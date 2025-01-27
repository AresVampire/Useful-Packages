# android_settings

Request Settings permission for android and set screen timeout.

## Usage

### Add to AndroidManifest.xml

<uses-permission android:name="android.permission.WRITE_SETTINGS" />

```dart
bool isGranted = await AndroidSettings.checkPermissionAllowed();
await AndroidSettings.requestPermission();
bool result = await AndroidSettings.setScreenTimeout(15000);
```
