import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';
import 'ai_assistant_screen.dart';
import 'directory_screen.dart';
import 'documents_screen.dart';
import 'manager_approvals_screen.dart';
import 'payslips_screen.dart';

class FutureMenuScreen extends StatelessWidget {
  const FutureMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'People services',
      subtitle: 'EMC',
      child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NoteBox(
              text: 'Quick access to employee services, manager approvals, and the AI assistant. Each item opens its own dedicated mobile screen.',
            ),
            const SectionLabel('Employee services'),
            _ServiceTile(icon: Icons.payments_outlined, title: 'Payslips', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PayslipsScreen()))),
            _ServiceTile(icon: Icons.file_copy_outlined, title: 'Documents', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentsScreen()))),
            _ServiceTile(icon: Icons.groups_outlined, title: 'Directory / org chart', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DirectoryScreen()))),
            const SectionLabel('Manager'),
            _ServiceTile(icon: Icons.playlist_add_check, title: 'Approvals with context', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ManagerApprovalsScreen()))),
            const SectionLabel('Assistant'),
            _ServiceTile(icon: Icons.auto_awesome, title: 'AI assistant (voice / agentic)', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AiAssistantScreen()))),
          ],
        ),
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ServiceTile({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return EMCCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.cyan),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w900))),
          const Icon(Icons.chevron_right, color: AppColors.text3),
        ],
      ),
    );
  }
}
