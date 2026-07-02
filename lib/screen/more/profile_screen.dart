import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'My profile',
      child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your record in Core HR.', style: TextStyle(color: AppColors.text2, fontSize: 13)),
            const SectionLabel('Editable'),
            const FormFieldBlock(label: 'Mobile number', child: TextField(decoration: InputDecoration(hintText: '+971 50 123 4567'))),
            const FormFieldBlock(label: 'Personal email', child: TextField(decoration: InputDecoration(hintText: 'ahmed@example.com'))),
            const FormFieldBlock(label: 'Emergency contact', child: TextField(decoration: InputDecoration(hintText: 'Sara · +971 50 765 4321'))),
            const FormFieldBlock(label: 'Address', child: TextField(decoration: InputDecoration(hintText: 'Abu Dhabi, UAE'))),
            GradientButton(text: 'Save changes', onPressed: () => showAppToast(context, 'Profile changes saved')),
            const SectionLabel('Verification required'),
            EMCCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(child: Text('Bank / IBAN', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900))),
                      InfoPill('Verified change', type: PillType.warn),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Changing where your salary is paid is sensitive. It goes through verification and approval before payroll uses it.',
                    style: TextStyle(color: AppColors.text2, height: 1.5),
                  ),
                  const SizedBox(height: 10),
                  const FormFieldBlock(label: 'IBAN', child: TextField(readOnly: true, decoration: InputDecoration(hintText: 'AE•• •••• •••• •••• 4821'))),
                  GhostButton(text: 'Request bank detail change', onPressed: () => showAppToast(context, 'Bank change request sent for verification')),
                ],
              ),
            ),
            const NoteBox(text: 'Low-sensitivity fields save directly; bank/IBAN must route through verification and approval, never a silent self-edit.'),
          ],
        ),
      ),
    );
  }
}
