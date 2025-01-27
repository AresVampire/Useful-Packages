# android_settings

Request Settings permission for android and set screen timeout.

### Usage

```dart
bool isGranted = await AndroidSettings.requestPermission();
bool result = await AndroidSettings.setScreenTimeout(15000);
```
