import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  int duration = 0;

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Request leave',
      child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Choose duration type, then dates.', style: TextStyle(color: AppColors.text2, fontSize: 13)),
            const SizedBox(height: 14),
            FormFieldBlock(
              label: 'Leave type',
              child: DropdownButtonFormField<String>(
                value: 'Annual',
                items: const ['Annual', 'Sick', 'Short leave', 'Unpaid']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (_) {},
              ),
            ),
            const FieldLabel('Duration'),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 0, label: Text('Whole day')),
                ButtonSegment(value: 1, label: Text('Half day')),
                ButtonSegment(value: 2, label: Text('Hours')),
              ],
              selected: {duration},
              onSelectionChanged: (value) => setState(() => duration = value.first),
            ),
            const SizedBox(height: 13),
            if (duration == 0) ...const [
              FormFieldBlock(label: 'From', child: TextField(decoration: InputDecoration(hintText: '12 Jul 2026'))),
              FormFieldBlock(label: 'To', child: TextField(decoration: InputDecoration(hintText: '13 Jul 2026'))),
            ],
            if (duration == 1) ...[
              const FormFieldBlock(label: 'Date', child: TextField(decoration: InputDecoration(hintText: '12 Jul 2026'))),
              FormFieldBlock(
                label: 'Which half',
                child: DropdownButtonFormField<String>(
                  value: 'Morning',
                  items: const ['Morning', 'Afternoon'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (_) {},
                ),
              ),
            ],
            if (duration == 2) ...[
              const FormFieldBlock(label: 'Date', child: TextField(decoration: InputDecoration(hintText: '12 Jul 2026'))),
              const Row(
                children: [
                  Expanded(child: FormFieldBlock(label: 'From', child: TextField(decoration: InputDecoration(hintText: '14:00')))),
                  SizedBox(width: 10),
                  Expanded(child: FormFieldBlock(label: 'To', child: TextField(decoration: InputDecoration(hintText: '16:00')))),
                ],
              ),
            ],
            const FormFieldBlock(label: 'Note (optional)', child: TextField(maxLines: 2)),
            const NoteBox(text: 'Routes to your line manager (Thomas Hayward) for approval. You\'ll be notified of the decision. Authority is enforced server-side.'),
            GradientButton(
              text: 'Submit request',
              onPressed: () {
                showAppToast(context, 'Leave request submitted');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
