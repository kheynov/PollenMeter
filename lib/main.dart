import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pollen_meter/routes.dart';
import 'package:pollen_meter/theme.dart';

import 'core_ui/bottom_nav_bar.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  initializeFirebase();
}

void initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pollen meter',
      theme: brightTheme,
      routerConfig: RouteGenerator().router,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('MyHomePage'),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("MyHomePage2"),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
