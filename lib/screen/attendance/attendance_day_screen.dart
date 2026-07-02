import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class AttendanceDayScreen extends StatelessWidget {
  final bool correctionRequested;
  final VoidCallback onRequestCorrection;

  const AttendanceDayScreen({super.key, required this.correctionRequested, required this.onRequestCorrection});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Mon 29 Jun',
      child: ScreenPad(
        child: Column(
          children: [
            EMCCard(
              backgroundColor: AppColors.warnBg,
              borderColor: const Color(0xFF3A3010),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.warning_amber_outlined, color: AppColors.warn, size: 21),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          correctionRequested ? 'Correction requested' : 'Missing check-out',
                          style: const TextStyle(color: AppColors.warn, fontSize: 14, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          correctionRequested
                              ? 'A correction for the missing check-out is awaiting manager approval.'
                              : 'You checked in at 08:09 but no check-out was recorded. Request a correction to fix your hours.',
                          style: const TextStyle(color: Color(0xFFC79A3A), fontSize: 12.5, height: 1.45),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            EMCCard(
              child: Column(
                children: [
                  const _InfoLine(label: 'Check in', value: '08:09 · EMC HQ'),
                  _InfoLine(label: 'Check out', value: correctionRequested ? '17:24 (requested)' : '— missing', valueColor: correctionRequested ? AppColors.cyan : AppColors.warn),
                  const _InfoLine(label: 'Recorded hours', value: '—', showBorder: false),
                ],
              ),
            ),
            GradientButton(text: 'Request correction', icon: Icons.edit_outlined, onPressed: onRequestCorrection),
          ],
        ),
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool showBorder;

  const _InfoLine({required this.label, required this.value, this.valueColor, this.showBorder = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: showBorder ? const Border(bottom: BorderSide(color: AppColors.line)) : null),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: AppColors.text2, fontSize: 13))),
          Text(value, style: TextStyle(color: valueColor ?? AppColors.text, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}
