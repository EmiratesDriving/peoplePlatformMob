import 'package:flutter/material.dart';

import '../widgets/common.dart';
import 'manager_correction_detail_screen.dart';
import 'manager_leave_approval_detail_screen.dart';

class ManagerApprovalsScreen extends StatefulWidget {
  const ManagerApprovalsScreen({super.key});

  @override
  State<ManagerApprovalsScreen> createState() => _ManagerApprovalsScreenState();
}

class _ManagerApprovalsScreenState extends State<ManagerApprovalsScreen> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Approvals',
            child: ScreenPad(
        child: Column(
          children: [
            SegmentedButton<int>(
              segments: const [ButtonSegment(value: 0, label: Text('Pending (3)')), ButtonSegment(value: 1, label: Text('Decided'))],
              selected: {tab},
              onSelectionChanged: (value) => setState(() => tab = value.first),
            ),
            const SizedBox(height: 12),
            if (tab == 0) _pending(context) else _decided(),
          ],
        ),
      ),
    );
  }

  Widget _pending(BuildContext context) {
    return EMCCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Column(
        children: [
          ListRow(
                        icon: Icons.flight_takeoff,
            title: 'Ahmed — annual, 2 days',
            subtitle: '12-13 Jul · family travel',
            trailing: const InfoPill('Pending', type: PillType.warn),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ManagerLeaveApprovalDetailScreen())),
          ),
          ListRow(
                        icon: Icons.edit_outlined,
            title: 'Hannah — correction',
            subtitle: 'Missing punch, 29 Jun',
            trailing: const InfoPill('Pending', type: PillType.warn),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ManagerCorrectionDetailScreen())),
          ),
          ListRow(
                        icon: Icons.access_time,
            title: 'Emily — short leave, 2h',
            subtitle: '3 Jul, 14:00-16:00',
            trailing: const InfoPill('Pending', type: PillType.warn),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ManagerLeaveApprovalDetailScreen())),
          ),
        ],
      ),
    );
  }

  Widget _decided() {
    return const EMCCard(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Column(
        children: [
          ListRow(icon: Icons.flight_takeoff, title: 'Ahmed — annual, 1 day', subtitle: '2 Jun · approved 28 May', trailing: InfoPill('Approved', type: PillType.good)),
          ListRow(icon: Icons.favorite_border, title: 'Hannah — sick, 1 day', subtitle: '19 Jun · approved', trailing: InfoPill('Approved', type: PillType.good)),
          ListRow(icon: Icons.flight_takeoff, title: 'Ahmed — annual, 3 days', subtitle: '2-4 Jun · returned', trailing: InfoPill('Returned', type: PillType.bad)),
        ],
      ),
    );
  }
}
