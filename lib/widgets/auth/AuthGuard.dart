import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_your_life/common/injector/injector.dart';
import 'package:task_your_life/view_models/auth_view_model.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;
  final authViewModel = getIt<AuthViewModel>();

  AuthGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (authViewModel.currentUser != null) {
      return child;
    } else {
      Future.microtask(() {
        context.go('/login');
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
