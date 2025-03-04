import 'dart:io';

import 'package:android_settings/android_settings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'utils/text_no_selection_controls.dart';

part 'main.freezed.dart';
part 'main.g.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // fontFamily: 'Avenir',
          // appBarTheme: const AppBarTheme(
          //   titleTextStyle: TextStyle(
          //     fontFamily: 'Avenir',
          //   ),
          // ),
          // tabBarTheme: const TabBarTheme(
          //   labelStyle: TextStyle(
          //     fontFamily: 'Avenir',
          //   ),
          //   unselectedLabelStyle: TextStyle(
          //     fontFamily: 'Avenir',
          //   ),
          // ),
          // textButtonTheme: TextButtonThemeData(
          //   style: ButtonStyle(
          //     textStyle: WidgetStateProperty.all(
          //       const TextStyle(
          //         fontFamily: 'Avenir',
          //       ),
          //     ),
          //   ),
          // ),
          ),
      home: ActivityView(),
    );
  }
}

class ActivityView extends ConsumerWidget {
  ActivityView({
    super.key,
  });

  final TextEditingController _controller = TextEditingController(
    text: '15000',
  );

  final List<bool> _checkedItems = [false, false, false];

  void _readFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      print('************');

      File readFile = File(result.files.single.path!);

      RandomAccessFile randomAccessFile =
          readFile.openSync(mode: FileMode.read);

      // randomAccessFile.flush(); // Flushes the file buffer to disk
      // await Process.run('cat', [readFile.path]);

      // await Process.run('sync', []); // Forces disk sync (Linux/Android)
      // await Future.delayed(
      //   const Duration(milliseconds: 100),
      // ); // Wait for cache flush

      await randomAccessFile.setPosition(0);
      Uint8List data =
          await randomAccessFile.read(await randomAccessFile.length());

      randomAccessFile.close();

      print(data);

      if (await Permission.manageExternalStorage.request() ==
          PermissionStatus.granted) {
        print('Permission granted');

        Directory? directory = await getExternalStorageDirectory();
        if (directory != null) {
          String filePath = directory.path.replaceAll(
            'Android/data/com.example.test_app/files',
            'test_file.txt',
          );
          print(filePath);

          File writeFile = File(filePath);
          print(await writeFile.exists());
          IOSink ioSink = writeFile.openWrite(mode: FileMode.append);
          ioSink.add([49, 50, 51, 52, 53, 54]);
          // await ioSink.flush(); // Flushes the file buffer to disk

          await ioSink.close();
        }
      } else {
        print('Permission denied');
      }
    }
  }

  void _showCustomPopupMenu(
      BuildContext context, TapDownDetails details) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx + 1,
        details.globalPosition.dy + 1,
      ),
      items: [
        PopupMenuItem(
          enabled: false, // Prevents auto-closing on selection
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  _checkedItems.length,
                  (index) {
                    return CheckboxListTile(
                      title: Text("Option ${index + 1}"),
                      value: _checkedItems[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _checkedItems[index] = value!;
                          if (index == 0 && value) {
                            _checkedItems[1] = false;
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  void _showMyDialog(BuildContext context) async {
    var myDialogRoute = DialogRoute(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("First Dialog"),
          content: Container(
            width: 300,
            height: 300,
            color: Colors.green,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text("Close First"),
            ),
          ],
        );
      },
    );

    Navigator.of(context).push(myDialogRoute);

    _openSecondDialog(context);

    await Future.delayed(const Duration(seconds: 2));

    if (myDialogRoute.isActive && context.mounted) {
      Navigator.of(context).removeRoute(myDialogRoute);
    }
  }

  void _openSecondDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Second Dialog"),
        content: const Text("This is the second dialog."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Close Second"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set screen time out')),
      body: ListView(
        children: [
          ElevatedButton(
            child: const Text('Request write settings permission'),
            onPressed: () async {
              bool result = await AndroidSettings.checkPermissionAllowed();
              if (!result) {
                await AndroidSettings.requestPermission();
              }
            },
          ),
          ElevatedButton(
            child: const Text('Set screen timeout to 15 2828658 seconds'),
            onPressed: () async {
              await AndroidSettings.setScreenTimeout(15000);
            },
          ),
          GestureDetector(
            onTapDown: (details) => _showCustomPopupMenu(context, details),
            child: const ElevatedButton(
              onPressed: null,
              child: Text('Show Popup Menu'),
            ),
          ),
          ElevatedButton(
            onPressed: () => _showMyDialog(context),
            child: const Text("Open Dialog"),
          ),
          ElevatedButton(
            onPressed: () => _readFile(),
            child: const Text("ReadFile"),
          ),
          TextField(
            controller: _controller,
            selectionControls: TextNoSelectionControls(),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final activity = ref.watch(activityProvider);

  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Pull to refresh')),
  //     body: RefreshIndicator(
  //       onRefresh: () => ref.refresh(activityProvider.future),
  //       child: ListView(
  //         children: [
  //           switch (activity) {
  //             AsyncValue<Activity>(:final valueOrNull?) =>
  //               Text(valueOrNull.activity),
  //             AsyncValue(:final error?) => Text('Error: $error'),
  //             _ => const CircularProgressIndicator(),
  //           },
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

@riverpod
Future<Activity> activity(Ref ref) async {
  return Activity.fromJson({});
}

@freezed
class Activity with _$Activity {
  factory Activity({
    required String activity,
    required String type,
    required int participants,
    required double price,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}

// final GlobalKey<NavigatorState> dialogNavigatorKey = GlobalKey<NavigatorState>();

// void popSpecificDialog() {
//   dialogNavigatorKey.currentState?.pop();
// }

// void popSpecificDialog(BuildContext context, Route<dynamic> targetRoute) {
//   Navigator.of(context).removeRoute(targetRoute);
// }
