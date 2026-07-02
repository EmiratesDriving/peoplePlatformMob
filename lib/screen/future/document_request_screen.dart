import 'package:flutter/material.dart';

import '../widgets/common.dart';

class DocumentRequestScreen extends StatelessWidget {
  const DocumentRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Request document',
            child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('HR issues the document to your Documents.', style: TextStyle(color: Color(0xFF9FB0BD), fontSize: 13)),
            const SizedBox(height: 14),
            FormFieldBlock(
              label: 'Document type',
              child: DropdownButtonFormField<String>(
                value: 'Salary certificate',
                items: const [
                  'Salary certificate',
                  'Salary certificate (for bank)',
                  'Employment / NOC letter',
                  'Experience certificate',
                ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (_) {},
              ),
            ),
            const FormFieldBlock(label: 'Addressed to (optional)', child: TextField(decoration: InputDecoration(hintText: 'e.g. Emirates NBD'))),
            const FormFieldBlock(label: 'Note (optional)', child: TextField(maxLines: 2)),
            GradientButton(text: 'Submit request', onPressed: () => showAppToast(context, 'Document request sent to HR')),
            const SizedBox(height: 14),
            const FutureBanner(
              title: 'Routes to HR',
              description: 'The issued document returns into the employee\'s Documents, generated server-side from verified record data.',
            ),
          ],
        ),
      ),
    );
  }
}
