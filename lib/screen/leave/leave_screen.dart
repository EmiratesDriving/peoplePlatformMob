import 'package:flutter/material.dart';

import '../widgets/common.dart';
import 'leave_request_screen.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenPad(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EMCCard(
            child: Column(
              children: [
                SectionLabel('Balances'),
                Stat3(items: [StatItem('18', 'Annual days'), StatItem('6', 'Sick days'), StatItem('4h', 'Short leave')]),
              ],
            ),
          ),
          GradientButton(
            text: 'Request leave',
            icon: Icons.add,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LeaveRequestScreen())),
          ),
          const SectionLabel('Recent requests'),
          const EMCCard(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Column(
              children: [
                ListRow(icon: Icons.flight_takeoff, title: 'Annual · 2 days', subtitle: '12-13 Jul · with Thomas Hayward', trailing: InfoPill('Pending', type: PillType.warn)),
                ListRow(icon: Icons.access_time, title: 'Short leave · 2h', subtitle: '28 Jun, 14:00-16:00', trailing: InfoPill('Approved', type: PillType.good)),
                ListRow(icon: Icons.favorite_border, title: 'Sick · 1 day', subtitle: '19 Jun', trailing: InfoPill('Approved', type: PillType.good)),
                ListRow(icon: Icons.flight_takeoff, title: 'Annual · 3 days', subtitle: '2-4 Jun', trailing: InfoPill('Rejected', type: PillType.bad)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
