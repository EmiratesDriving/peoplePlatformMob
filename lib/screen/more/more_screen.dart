import 'package:flutter/material.dart';

import '../future/ai_assistant_screen.dart';
import '../future/directory_screen.dart';
import '../future/documents_screen.dart';
import '../future/manager_approvals_screen.dart';
import '../future/payslips_screen.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import 'privacy_screen.dart';
import 'profile_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenPad(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EMCCard(
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: const BoxDecoration(shape: BoxShape.circle, gradient: AppGradients.brand),
                  alignment: Alignment.center,
                  child: const Text('AM', style: TextStyle(color: AppColors.buttonText, fontWeight: FontWeight.w900)),
                ),
                const SizedBox(width: 13),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ahmed Al Mansoori', style: TextStyle(fontWeight: FontWeight.w900)),
                      SizedBox(height: 3),
                      Text('Middleware Specialist · IT', style: TextStyle(color: AppColors.text2, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SectionLabel('Account'),
          EMCCard(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen())),
            child: const _MenuLine(icon: Icons.person_outline, text: 'My profile'),
          ),
          EMCCard(
            onTap: () => showAppToast(context, 'Notification preferences'),
            child: const _MenuLine(icon: Icons.notifications_none, text: 'Notification preferences'),
          ),
          const SectionLabel('Privacy'),
          EMCCard(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyScreen())),
            child: const _MenuLine(icon: Icons.shield_outlined, text: 'Privacy & location statement'),
          ),
          EMCCard(
            onTap: () => showAppToast(context, 'Help & support'),
            child: const _MenuLine(icon: Icons.help_outline, text: 'Help & support'),
          ),
          const SectionLabel('Employee services'),
          EMCCard(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PayslipsScreen())),
            child: const _MenuLine(icon: Icons.payments_outlined, text: 'Payslips'),
          ),
          EMCCard(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentsScreen())),
            child: const _MenuLine(icon: Icons.file_copy_outlined, text: 'Documents'),
          ),
          EMCCard(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DirectoryScreen())),
            child: const _MenuLine(icon: Icons.groups_outlined, text: 'Directory / org chart'),
          ),
          const SectionLabel('Manager'),
          EMCCard(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ManagerApprovalsScreen())),
            child: const _MenuLine(icon: Icons.playlist_add_check, text: 'Approvals with context'),
          ),
          const SectionLabel('Assistant'),
          EMCCard(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AiAssistantScreen())),
            child: const _MenuLine(icon: Icons.auto_awesome, text: 'AI assistant (voice / agentic)'),
          ),
          const EMCCard(
            child: Row(
              children: [
                Expanded(child: Text('App version', style: TextStyle(color: AppColors.text2))),
                Text('1.0 prototype', style: TextStyle(color: AppColors.text2)),
              ],
            ),
          ),
          GhostButton(text: 'Sign out', icon: Icons.logout, onPressed: () => Navigator.popUntil(context, (route) => route.isFirst)),
        ],
      ),
    );
  }
}

class _MenuLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MenuLine({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.cyan, size: 20),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: const TextStyle(fontWeight: FontWeight.w900))),
        const Icon(Icons.chevron_right, color: AppColors.text3),
      ],
    );
  }
}
