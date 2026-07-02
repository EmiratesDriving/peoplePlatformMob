import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_logo.dart';
import '../widgets/common.dart';
import 'permissions_screen.dart';

class DeviceRegistrationScreen extends StatelessWidget {
  const DeviceRegistrationScreen({super.key});

  void _next(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const PermissionsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const AppLogo(size: 64),
                const SizedBox(height: 20),
                const Text('Register this device', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                const SizedBox(height: 8),
                const Text(
                  'This device will be linked to your account so attendance punches can be attributed to you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.text2, fontSize: 14, height: 1.6),
                ),
                const SizedBox(height: 24),
                const EMCCard(
                  child: Row(
                    children: [
                      Icon(Icons.phone_android, color: AppColors.cyan),
                      SizedBox(width: 11),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pixel 8 Pro · Ahmed\'s device', style: TextStyle(fontWeight: FontWeight.w800)),
                            SizedBox(height: 3),
                            Text('First sign-in on this device', style: TextStyle(color: AppColors.text2, fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GradientButton(text: 'Register device', onPressed: () => _next(context)),
                const SizedBox(height: 8),
                GhostButton(text: 'Skip for now', height: 42, onPressed: () => _next(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
