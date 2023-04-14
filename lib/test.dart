import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePageTest1 extends StatelessWidget {
  const MyHomePageTest1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Test 1'),
        FloatingActionButton(onPressed: () => context.go('/calendar'))
      ])),
    );
  }
}

class MyHomePageTest2 extends StatelessWidget {
  const MyHomePageTest2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Test 2'),
        FloatingActionButton(onPressed: () => context.go('/dashboard'))
      ])),
    );
  }
}

class MyHomePageTest3 extends StatelessWidget {
  const MyHomePageTest3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Test 3'),
        FloatingActionButton(onPressed: () => context.go('/record'))
      ])),
    );
  }
}
