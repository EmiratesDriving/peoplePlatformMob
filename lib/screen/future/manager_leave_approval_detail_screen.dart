import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class ManagerLeaveApprovalDetailScreen extends StatelessWidget {
  const ManagerLeaveApprovalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Approval',
            child: ScreenPad(
        child: Column(
          children: [
            EMCCard(
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(color: AppColors.future, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: const Text('A', style: TextStyle(color: AppColors.futureBg, fontWeight: FontWeight.w900)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ahmed Al Mansoori', style: TextStyle(fontWeight: FontWeight.w900)),
                        SizedBox(height: 3),
                        Text('Annual leave · 2 days', style: TextStyle(color: AppColors.text2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const EMCCard(
              child: Column(
                children: [
                  SectionLabel('Context'),
                  _ContextLine('Dates', '12-13 Jul 2026'),
                  _ContextLine('Balance after', '16 days'),
                  _ContextLine('Team coverage', 'No clash', valueColor: AppColors.goodText),
                  _ContextLine('Reason', 'Family travel'),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: GradientButton(text: 'Approve', onPressed: () => showAppToast(context, 'Approved'))),
                const SizedBox(width: 8),
                Expanded(child: GhostButton(text: 'Return', onPressed: () => showAppToast(context, 'Returned'))),
              ],
            ),
            const SizedBox(height: 8),
            GhostButton(text: 'Reject', foregroundColor: AppColors.badText, onPressed: () => showAppToast(context, 'Rejected')),
            const SizedBox(height: 14),
            const FutureBanner(
              icon: Icons.lightbulb_outline,
              title: 'Context, not just buttons',
              description: 'The manager sees balance impact, team coverage, and reason before deciding. Actions commit through authenticated workflow endpoints.',
            ),
          ],
        ),
      ),
    );
  }
}

class _ContextLine extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _ContextLine(this.label, this.value, {this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: AppColors.text2))),
          Text(value, style: TextStyle(color: valueColor ?? AppColors.text, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}
