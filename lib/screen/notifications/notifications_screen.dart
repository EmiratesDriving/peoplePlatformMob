import 'package:flutter/material.dart';

import '../widgets/common.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Notifications',
      child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tap to open the related request.', style: TextStyle(color: Color(0xFF9FB0BD), fontSize: 13)),
            const SizedBox(height: 14),
            EMCCard(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Column(
                children: [
                  ListRow(icon: Icons.check_circle_outline, title: 'Short leave approved', subtitle: 'Thomas Hayward · 28 Jun', onTap: () => showAppToast(context, 'Open approved short leave')),
                  ListRow(icon: Icons.warning_amber_outlined, title: 'Correction needs your attention', subtitle: 'Mon 29 Jun missing punch · today', onTap: () => showAppToast(context, 'Open missing punch detail')),
                  ListRow(icon: Icons.access_time, title: 'Leave request pending', subtitle: '12-13 Jul · awaiting manager', onTap: () => showAppToast(context, 'Open pending leave request')),
                ],
              ),
            ),
            const NoteBox(text: 'Actionable, but not token-bearing. Opening a notification navigates to the request inside the authenticated app. The server re-checks who you are before any action commits.'),
          ],
        ),
      ),
    );
  }
}
