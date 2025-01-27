import 'package:android_settings/android_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.freezed.dart';
part 'main.g.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ActivityView());
  }
}

class ActivityView extends ConsumerWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set screen time out')),
      body: ListView(
        children: [
          ElevatedButton(
            child: const Text('Request write settings permission'),
            onPressed: () async {
              bool result = await AndroidSettings.requestPermission();
              print(result);
            },
          ),
          ElevatedButton(
            child: const Text('Set screen timeout to 15 seconds'),
            onPressed: () async {
              bool result = await AndroidSettings.setScreenTimeout(15000);
              print(result);
            },
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
