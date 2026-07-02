import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';
import 'document_detail_screen.dart';

class DocumentListScreen extends StatelessWidget {
  const DocumentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Salary certificates',
            child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Salary certificates', style: TextStyle(color: AppColors.text2, fontSize: 13)),
            const SizedBox(height: 14),
            EMCCard(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Column(
                children: [
                  ListRow(
                                        icon: Icons.card_membership_outlined,
                    title: 'Salary certificate',
                    subtitle: 'Issued 12 Jun 2026 · PDF',
                    trailing: const Icon(Icons.chevron_right, color: AppColors.text3),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentDetailScreen())),
                  ),
                  ListRow(
                                        icon: Icons.card_membership_outlined,
                    title: 'Salary certificate (bank)',
                    subtitle: 'Issued 3 Mar 2026 · PDF',
                    trailing: const Icon(Icons.chevron_right, color: AppColors.text3),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentDetailScreen())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
