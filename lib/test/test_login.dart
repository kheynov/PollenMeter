import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';

import '../main.dart';

class LoginTestMainPage extends ConsumerWidget {
  const LoginTestMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollenLogic = ref.watch(pollenDataProvider(Coordinates(45, 47)));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pollenLogic.when(
              data: (data) => Text(data.toString()),
              error: (Object error, StackTrace stackTrace) {
                return Text(error.toString());
              },
              loading: () => const Text('loading...'),
            ),
            FloatingActionButton(
              onPressed: () => context.go('/dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SignInScreen(
            providerConfigs: [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                clientId:
                    '374533370010-15698fjfa6tssse8gumdincoi8uam5lq.apps.googleusercontent.com',
              ),
            ],
          );
        } else {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text('Authorized')],
              ),
            ),
          );
        }
      },
    );
  }
}

class SignOutPage extends StatelessWidget {
  const SignOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign out'),
            FloatingActionButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
