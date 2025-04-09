import 'package:flutter/material.dart';
import 'package:task_your_life/widgets/auth/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      body: isLargeScreen
          ? Row(
              children: [
                // Left image
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login_bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Right form
                const Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 400,
                      child: LoginForm(),
                    ),
                  ),
                ),
              ],
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                // Background image
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login_bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Dark overlay
                Container(color: Colors.black.withOpacity(0.5)),
                // Center form
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: LoginForm(),
                  ),
                ),
              ],
            ),
    );
  }
}
