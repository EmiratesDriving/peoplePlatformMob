import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_logo.dart';
import '../widgets/common.dart';
import 'device_registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogo(size: 64),
                  const SizedBox(height: 24),
                  const Text(
                    'EMC People Platform',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.text, fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Sign in with your Emirates Mobility account to\ncontinue.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFFC7E5F4), fontSize: 14, height: 1.45),
                  ),
                  const SizedBox(height: 36),
                  GradientButton(
                    text: 'Sign in with Entra ID',
                    icon: Icons.window,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const DeviceRegistrationScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Authentication is handled by your organization\'s Microsoft Entra ID.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.text3, fontSize: 11, height: 1.4),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'No separate password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.text3, fontSize: 11, height: 1.4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
