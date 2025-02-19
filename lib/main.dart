import 'package:android_settings/android_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
              print(result);
              if (!result) {
                await AndroidSettings.requestPermission();
              }
            },
          ),
          ElevatedButton(
            child: const Text('Set screen timeout to 15 2828658 seconds'),
            onPressed: () async {
              bool result = await AndroidSettings.setScreenTimeout(15000);
              print(result);
            },
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
