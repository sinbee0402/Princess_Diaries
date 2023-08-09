import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:princess_diaries/presentation/components/curved_navigation_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting().then((_) => runApp(const MyApp()));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CurvedNavigationWidget(),
    );
  }
}
