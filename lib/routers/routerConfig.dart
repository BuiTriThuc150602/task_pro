import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:task_your_life/view_models/auth_view_model.dart';
import 'package:task_your_life/views/auth/login.dart';
import 'package:task_your_life/views/home/HomeScreen.dart';

GoRouter get routerConfig => GoRouter(
      initialLocation: '/login',
      redirect: (BuildContext context, GoRouterState state) {
        final authViewModel =
            Provider.of<AuthViewModel>(context, listen: false);
        final isLoggedIn = authViewModel.currentUser != null;
        final isLoggingIn = state.path == '/login';

        if (!isLoggedIn && !isLoggingIn) return '/login';
        if (isLoggedIn && isLoggingIn) return '/home';
        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return LoginScreen(
              authViewModel: Provider.of<AuthViewModel>(context, listen: false),
            );
          },
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return const HomeScreen(title: 'Task Your Life');
          },
        ),
      ],
    );
