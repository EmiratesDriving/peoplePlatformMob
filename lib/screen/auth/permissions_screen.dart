import 'package:flutter/material.dart';

import '../main_shell.dart';
import '../theme/app_theme.dart';
import '../widgets/app_logo.dart';
import '../widgets/common.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool location = true;
  bool biometric = true;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: ScreenPad(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 28),
          child: Column(
            children: [
              const AppLogo(size: 64),
              const SizedBox(height: 20),
              const Text('Permissions', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              const Text(
                'Each is optional and can be changed later. We only use these for the features you turn on.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.text2, fontSize: 14, height: 1.6),
              ),
              const SizedBox(height: 22),
              _PermissionTile(
                icon: Icons.location_on_outlined,
                title: 'Location',
                subtitle: 'Used only at the moment you punch, to check you\'re on-site. Not tracked continuously.',
                value: location,
                onChanged: (value) => setState(() => location = value),
              ),
              _PermissionTile(
                icon: Icons.face_retouching_natural_outlined,
                title: 'Face / biometric',
                subtitle: 'On-device check only. The image never leaves your phone — only a match result is sent.',
                value: biometric,
                onChanged: (value) => setState(() => biometric = value),
              ),
              _PermissionTile(
                icon: Icons.notifications_none,
                title: 'Notifications',
                subtitle: 'Approval decisions, reminders, corrections.',
                value: notifications,
                onChanged: (value) => setState(() => notifications = value),
              ),
              GradientButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const MainShell()),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 14),
              const Text(
                'See the full privacy and location statement any time under More.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.text3, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _PermissionTile({required this.icon, required this.title, required this.subtitle, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return EMCCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.cyan, size: 22),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: AppColors.text2, fontSize: 12, height: 1.45)),
              ],
            ),
          ),
          Switch(value: value, activeThumbColor: AppColors.cyan, onChanged: onChanged),
        ],
      ),
    );
  }
}
