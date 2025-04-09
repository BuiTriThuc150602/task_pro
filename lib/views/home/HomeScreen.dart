import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_your_life/common/injector/injector.dart';
import 'package:task_your_life/view_models/auth_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authViewModel = getIt<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Wellcome ${authViewModel.currentUser?.username}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          authViewModel.logout();
          context.go('/login');
        },
        tooltip: 'Logout',
        child: const Icon(Icons.add),
      ),
    );
  }
}
