import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  bool listening = false;

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'AI assistant',
            child: ScreenPad(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Voice / agentic assistant', style: TextStyle(color: AppColors.text2, fontSize: 13)),
            const SizedBox(height: 14),
            EMCCard(
              backgroundColor: AppColors.panel2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Bubble(text: 'Hi Ahmed, how can I help?'),
                  const _Bubble(text: 'Request annual leave for next Thursday', fromUser: true),
                  _Bubble(
                    text: 'I\'ll request annual leave, Thu 3 Jul, 1 day. Confirm to submit?',
                    action: Wrap(
                      spacing: 8,
                      children: [
                        InkWell(onTap: () => showAppToast(context, 'Submitted via authenticated endpoint'), child: const InfoPill('Confirm')),
                        const InfoPill('Cancel', type: PillType.bad),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const _Bubble(text: 'How many annual days do I have left?', fromUser: true),
            const _Bubble(text: 'You have 18 annual days remaining, plus 6 sick days. A read-only answer — nothing is changed.'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: ['My balance', 'Where\'s my correction?', 'Book leave']
                  .map((s) => ActionChip(label: Text(s), onPressed: () => showAppToast(context, 'Suggested intent selected')))
                  .toList(),
            ),
            const SizedBox(height: 12),
            if (!listening)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.panel2,
                  border: Border.all(color: AppColors.line),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Expanded(child: TextField(decoration: InputDecoration.collapsed(hintText: 'Ask or speak…'))),
                    IconButton(
                      onPressed: () => setState(() => listening = true),
                      icon: const Icon(Icons.mic, color: AppColors.future),
                    ),
                  ],
                ),
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.futureBg,
                  border: Border.all(color: AppColors.futureBorder),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.mic, color: AppColors.future, size: 30),
                    const SizedBox(height: 8),
                    const Text('Listening...', style: TextStyle(color: AppColors.futureText, fontSize: 13)),
                    const SizedBox(height: 3),
                    const Text('Request annual leave for Thursday', style: TextStyle(color: AppColors.text2)),
                    const SizedBox(height: 10),
                    GhostButton(text: 'Stop', height: 38, onPressed: () => setState(() => listening = false)),
                  ],
                ),
              ),
            const SizedBox(height: 14),
            const FutureBanner(
              icon: Icons.shield_outlined,
              title: 'Security rule for whoever specs this',
              description: 'The assistant interprets intent and pre-fills, but always confirms before acting. Every action commits through existing authenticated endpoints with server-side authorization.',
            ),
          ],
        ),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final String text;
  final bool fromUser;
  final Widget? action;

  const _Bubble({required this.text, this.fromUser = false, this.action});

  @override
  Widget build(BuildContext context) {
    final bubble = Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: fromUser ? AppColors.future.withOpacity(.18) : AppColors.panel3,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: const TextStyle(fontSize: 13, height: 1.4)),
          if (action != null) ...[const SizedBox(height: 9), action!],
        ],
      ),
    );

    if (fromUser) {
      return Align(alignment: Alignment.centerRight, child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 290), child: bubble));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(color: AppColors.future, shape: BoxShape.circle),
          child: const Icon(Icons.auto_awesome, size: 17, color: AppColors.futureBg),
        ),
        const SizedBox(width: 9),
        Expanded(child: bubble),
      ],
    );
  }
}
