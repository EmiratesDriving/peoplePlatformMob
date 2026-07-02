import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Privacy & location',
      child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plain language. Required under PDPL.', style: TextStyle(color: AppColors.text2, fontSize: 13)),
            SizedBox(height: 14),
            _PrivacyCard(icon: Icons.location_on_outlined, title: 'Location', body: 'We read your location only at the moment you punch in or out, to check whether you are on-site. We do not track you continuously.'),
            _PrivacyCard(icon: Icons.face_retouching_natural_outlined, title: 'Face / biometric', body: 'Face matching happens on your device. The image never leaves your phone. Only the yes/no match result is sent.'),
            _PrivacyCard(icon: Icons.storage_outlined, title: 'Your data', body: 'You can withdraw any permission under More at any time. Withdrawing a permission disables the feature that uses it.'),
          ],
        ),
      ),
    );
  }
}

class _PrivacyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const _PrivacyCard({required this.icon, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return EMCCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Icon(icon, color: AppColors.cyan), const SizedBox(width: 7), Text(title, style: const TextStyle(fontWeight: FontWeight.w900))]),
          const SizedBox(height: 6),
          Text(body, style: const TextStyle(color: AppColors.text2, height: 1.6)),
        ],
      ),
    );
  }
}
