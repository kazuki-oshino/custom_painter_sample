import 'package:custom_painter_sample/views/graph/graph_screen.dart';
import 'package:custom_painter_sample/views/page_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import 'models/navigator.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageSelectScreen(),
      navigatorKey: useProvider(navigatorKeyProvider),
      debugShowCheckedModeBanner: false,
    );
  }
}

