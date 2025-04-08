import 'package:go_router/go_router.dart';
import 'package:task_your_life/views/auth/login.dart';
import 'package:task_your_life/views/home/HomeScreen.dart';
import 'package:task_your_life/widgets/auth/AuthGuard.dart';

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const AuthGuard(
        child: HomeScreen(
          title: 'Task Your Life',
        ),
      ),
    ),
  ],
);

get routerConfig => _router;
