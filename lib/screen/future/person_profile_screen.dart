import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class PersonProfileScreen extends StatelessWidget {
  final String name;
  final String role;

  const PersonProfileScreen({super.key, this.name = 'Thomas Hayward', this.role = 'Manager · Information Technology'});

  @override
  Widget build(BuildContext context) {
    final initials = name.split(' ').take(2).map((e) => e[0]).join();
    return AppPage(
      title: 'Profile',
            child: ScreenPad(
        child: Column(
          children: [
            EMCCard(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(color: AppColors.future, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Text(initials, style: const TextStyle(color: AppColors.futureBg, fontWeight: FontWeight.w900)),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
                        const SizedBox(height: 3),
                        Text(role, style: const TextStyle(color: AppColors.text2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: GradientButton(text: 'Email', icon: Icons.mail_outline, onPressed: () => showAppToast(context, 'Open email'))),
                const SizedBox(width: 8),
                Expanded(child: GhostButton(text: 'Call', icon: Icons.phone_outlined, onPressed: () => showAppToast(context, 'Call extension'))),
              ],
            ),
            const SizedBox(height: 12),
            const EMCCard(
              child: Column(
                children: [
                  _PersonLine(icon: Icons.mail_outline, label: 'Email', value: 't.hayward@example.com'),
                  _PersonLine(icon: Icons.phone_outlined, label: 'Extension', value: '4021'),
                  _PersonLine(icon: Icons.groups_outlined, label: 'Reports to', value: 'George Wright'),
                ],
              ),
            ),
            const FutureBanner(
              title: 'Person card',
              description: 'Contact details and reporting line. What is shown is governed by directory visibility rules.',
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonLine extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _PersonLine({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: AppColors.future, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(label, style: const TextStyle(color: AppColors.text2))),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
        ],
      ),
    );
  }
}
