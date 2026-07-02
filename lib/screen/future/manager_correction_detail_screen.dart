import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class ManagerCorrectionDetailScreen extends StatelessWidget {
  const ManagerCorrectionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Correction',
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
                    child: const Text('H', style: TextStyle(color: AppColors.futureBg, fontWeight: FontWeight.w900)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hannah Frost', style: TextStyle(fontWeight: FontWeight.w900)),
                        SizedBox(height: 3),
                        Text('Attendance correction', style: TextStyle(color: AppColors.text2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const EMCCard(
              child: Column(
                children: [
                  SectionLabel('What changed'),
                  _ChangeLine('Date', 'Mon 29 Jun 2026'),
                  _ChangeLine('Recorded', 'No check-out', valueColor: AppColors.warn),
                  _ChangeLine('Requested', 'Check-out 17:24', valueColor: AppColors.cyan),
                  _ChangeLine('Reason given', 'Forgot to punch out'),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: GradientButton(text: 'Approve', onPressed: () => showAppToast(context, 'Correction approved'))),
                const SizedBox(width: 8),
                Expanded(child: GhostButton(text: 'Return', onPressed: () => showAppToast(context, 'Returned'))),
              ],
            ),
            const SizedBox(height: 14),
            const FutureBanner(
              icon: Icons.lightbulb_outline,
              title: 'Correction = before/after',
              description: 'A correction approval shows the recorded value against the requested value, so the manager approves a specific change.',
            ),
          ],
        ),
      ),
    );
  }
}

class _ChangeLine extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _ChangeLine(this.label, this.value, {this.valueColor});

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
