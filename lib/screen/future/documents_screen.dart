import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';
import 'document_list_screen.dart';
import 'document_request_screen.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Documents',
            child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Browse by category.', style: TextStyle(color: AppColors.text2, fontSize: 13)),
            const SizedBox(height: 14),
            _DocCategory(icon: Icons.card_membership_outlined, title: 'Salary certificates', count: 3, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentListScreen()))),
            _DocCategory(icon: Icons.description_outlined, title: 'Employment letters', count: 2, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentListScreen()))),
            _DocCategory(icon: Icons.file_copy_outlined, title: 'Contracts', count: 1, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentListScreen()))),
            GhostButton(text: 'Request a document', icon: Icons.add, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentRequestScreen()))),
          ],
        ),
      ),
    );
  }
}

class _DocCategory extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;
  final VoidCallback onTap;

  const _DocCategory({required this.icon, required this.title, required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return EMCCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.future),
          const SizedBox(width: 10),
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w900))),
          Text('$count ›', style: const TextStyle(color: AppColors.text2)),
        ],
      ),
    );
  }
}
