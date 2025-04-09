import 'package:go_router/go_router.dart';
import 'package:task_your_life/views/auth/login.dart';
import 'package:task_your_life/views/home/HomeScreen.dart';
import 'package:task_your_life/widgets/auth/AuthGuard.dart';

GoRouter get routerConfig => GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => AuthGuard(
            child: const HomeScreen(title: 'Task Your Life'),
          ),
        ),
      ],
    );
