import 'package:flutter/material.dart';

import '../widgets/common.dart';

class CorrectionRequestScreen extends StatelessWidget {
  final VoidCallback onSubmitted;

  const CorrectionRequestScreen({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Request correction',
      child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Goes to your manager for approval.', style: TextStyle(color: Color(0xFF9FB0BD), fontSize: 13)),
            const SizedBox(height: 14),
            const FormFieldBlock(label: 'Date', child: TextField(readOnly: true, decoration: InputDecoration(hintText: 'Mon 29 Jun 2026'))),
            FormFieldBlock(
              label: 'What needs fixing',
              child: DropdownButtonFormField<String>(
                value: 'Missing check-out',
                items: const [
                  DropdownMenuItem(value: 'Missing check-out', child: Text('Missing check-out')),
                  DropdownMenuItem(value: 'Missing check-in', child: Text('Missing check-in')),
                  DropdownMenuItem(value: 'Wrong time', child: Text('Wrong time')),
                  DropdownMenuItem(value: 'Off-site flag dispute', child: Text('Off-site flag dispute')),
                ],
                onChanged: (_) {},
              ),
            ),
            const FormFieldBlock(label: 'Correct check-out time', child: TextField(decoration: InputDecoration(hintText: '17:24'))),
            const FormFieldBlock(label: 'Reason (manager sees this)', child: TextField(maxLines: 3, decoration: InputDecoration(hintText: 'Forgot to check out before leaving site.'))),
            GradientButton(
              text: 'Submit for approval',
              onPressed: () {
                onSubmitted();
                showAppToast(context, 'Correction submitted for approval');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
