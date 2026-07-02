import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';
import 'payslip_detail_screen.dart';

class PayslipsScreen extends StatelessWidget {
  const PayslipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Payslips',
            child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tap a month for the breakdown.', style: TextStyle(color: AppColors.text2, fontSize: 13)),
            const SizedBox(height: 14),
            EMCCard(
              backgroundColor: AppColors.futureBg.withOpacity(.7),
              borderColor: AppColors.futureBorder,
              child: const Column(
                children: [
                  SectionLabel('Year to date · 2026'),
                  Stat3(items: [StatItem('114,000', 'Gross AED'), StatItem('3,600', 'Deductions'), StatItem('110,400', 'Net AED')]),
                ],
              ),
            ),
            EMCCard(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Column(
                children: [
                  _PayslipRow(month: 'June 2026', net: 'AED 18,400', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PayslipDetailScreen()))),
                  _PayslipRow(month: 'May 2026', net: 'AED 18,400', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PayslipDetailScreen()))),
                  _PayslipRow(month: 'April 2026', net: 'AED 18,400', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PayslipDetailScreen()))),
                ],
              ),
            ),
            const FutureBanner(
              icon: Icons.lock_outline,
              title: 'Secure payroll data',
              description: 'Payslips are protected employee records. Authorization, masking, and document download security must be enforced by the backend.',
            ),
          ],
        ),
      ),
    );
  }
}

class _PayslipRow extends StatelessWidget {
  final String month;
  final String net;
  final VoidCallback onTap;

  const _PayslipRow({required this.month, required this.net, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListRow(
            icon: Icons.request_quote_outlined,
      title: month,
      subtitle: 'Net $net',
      trailing: const Icon(Icons.chevron_right, color: AppColors.text3),
      onTap: onTap,
    );
  }
}
