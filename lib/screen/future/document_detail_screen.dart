import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class DocumentDetailScreen extends StatelessWidget {
  const DocumentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Document',
            child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Salary certificate', style: TextStyle(color: AppColors.text2, fontSize: 13)),
            const SizedBox(height: 14),
            const EMCCard(
              child: SizedBox(
                height: 180,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.card_membership_outlined, size: 42, color: AppColors.future),
                      SizedBox(height: 8),
                      Text('Document preview', style: TextStyle(color: AppColors.text3)),
                    ],
                  ),
                ),
              ),
            ),
            const EMCCard(
              child: Column(
                children: [
                  _DocLine('Type', 'Salary certificate'),
                  _DocLine('Issued', '12 Jun 2026'),
                  _DocLine('Format', 'PDF · 142 KB'),
                ],
              ),
            ),
            GhostButton(text: 'Download', icon: Icons.download, onPressed: () => showAppToast(context, 'Document download')),
          ],
        ),
      ),
    );
  }
}

class _DocLine extends StatelessWidget {
  final String label;
  final String value;

  const _DocLine(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: AppColors.text2))),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}
