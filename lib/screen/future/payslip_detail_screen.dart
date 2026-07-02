import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class PayslipDetailScreen extends StatelessWidget {
  const PayslipDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'June 2026',
            child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Payslip · June 2026', style: TextStyle(color: AppColors.text2, fontSize: 13)),
            const SizedBox(height: 14),
            const EMCCard(
              child: Column(
                children: [
                  SectionLabel('Earnings'),
                  _MoneyLine('Basic salary', 'AED 12,000'),
                  _MoneyLine('Housing allowance', 'AED 5,000'),
                  _MoneyLine('Transport allowance', 'AED 2,000'),
                  Divider(color: AppColors.line),
                  _MoneyLine('Gross', 'AED 19,000', strong: true),
                ],
              ),
            ),
            const EMCCard(
              child: Column(
                children: [
                  SectionLabel('Deductions'),
                  _MoneyLine('Pension (GPSSA 5%)', 'AED 600'),
                  _MoneyLine('Unpaid leave', 'AED 0'),
                  Divider(color: AppColors.line),
                  _MoneyLine('Total deductions', 'AED 600', strong: true),
                ],
              ),
            ),
            EMCCard(
              backgroundColor: AppColors.futureBg,
              borderColor: AppColors.futureBorder,
              child: const Row(
                children: [
                  Expanded(child: Text('Net pay', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900))),
                  Text('AED 18,400', style: TextStyle(fontSize: 18, color: AppColors.futureText, fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            GhostButton(text: 'Download PDF', icon: Icons.download, onPressed: () => showAppToast(context, 'Payslip PDF')),
          ],
        ),
      ),
    );
  }
}

class _MoneyLine extends StatelessWidget {
  final String label;
  final String value;
  final bool strong;

  const _MoneyLine(this.label, this.value, {this.strong = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyle(color: strong ? AppColors.text : AppColors.text2, fontWeight: strong ? FontWeight.w900 : FontWeight.w400))),
          Text(value, style: TextStyle(fontWeight: strong ? FontWeight.w900 : FontWeight.w700)),
        ],
      ),
    );
  }
}
