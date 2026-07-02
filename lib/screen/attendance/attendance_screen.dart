import 'package:flutter/material.dart';

import '../widgets/common.dart';

class AttendanceScreen extends StatelessWidget {
  final bool correctionRequested;
  final VoidCallback onDayTap;
  final VoidCallback onCorrection;

  const AttendanceScreen({
    super.key,
    required this.correctionRequested,
    required this.onDayTap,
    required this.onCorrection,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenPad(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your records. Tap a day for detail.', style: TextStyle(color: Color(0xFF9FB0BD), fontSize: 13)),
          const SizedBox(height: 14),
          EMCCard(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Column(
              children: [
                ListRow(icon: Icons.calendar_month_outlined, title: 'Tue 30 Jun', subtitle: '08:12 in · still on-site', trailing: const InfoPill('Open'), onTap: onDayTap),
                ListRow(
                  icon: Icons.calendar_month_outlined,
                  title: 'Mon 29 Jun',
                  subtitle: correctionRequested ? 'Correction requested · awaiting manager' : 'No check-out recorded',
                  trailing: InfoPill(correctionRequested ? 'Requested' : 'Missing', type: correctionRequested ? PillType.info : PillType.warn),
                  onTap: onDayTap,
                ),
                ListRow(icon: Icons.calendar_month_outlined, title: 'Sun 28 Jun', subtitle: '08:03 in · 17:31 out', trailing: const InfoPill('9.5h', type: PillType.good), onTap: onDayTap),
                ListRow(icon: Icons.calendar_month_outlined, title: 'Thu 25 Jun', subtitle: '08:20 in · 16:58 out · flagged off-site', trailing: const InfoPill('Flagged', type: PillType.bad), onTap: onDayTap),
                ListRow(icon: Icons.calendar_month_outlined, title: 'Wed 24 Jun', subtitle: '07:58 in · 17:10 out', trailing: const InfoPill('9.2h', type: PillType.good), onTap: onDayTap),
              ],
            ),
          ),
          GhostButton(text: 'Request a correction', icon: Icons.edit_outlined, onPressed: onCorrection),
        ],
      ),
    );
  }
}
