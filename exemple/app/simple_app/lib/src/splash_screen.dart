import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Splash Page'),
            SizedBox(height: 16),
            const SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
