import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'common.dart';

class AiAssistantFab extends StatelessWidget {
  const AiAssistantFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 72, right: 4),
      child: GestureDetector(
        onTap: () => _openAiAssistant(context),
        child: Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppGradients.brand,
            boxShadow: [
              BoxShadow(
                color: AppColors.cyan.withOpacity(0.35),
                blurRadius: 22,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Icons.auto_awesome,
            color: AppColors.buttonText,
            size: 26,
          ),
        ),
      ),
    );
  }

  void _openAiAssistant(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.appBackground,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const _AiAssistantSheet(),
    );
  }
}

class _AiAssistantSheet extends StatefulWidget {
  const _AiAssistantSheet();

  @override
  State<_AiAssistantSheet> createState() => _AiAssistantSheetState();
}

class _AiAssistantSheetState extends State<_AiAssistantSheet> {
  final TextEditingController _controller = TextEditingController();
  bool _listening = false;

  final List<_ChatMessage> _messages = [
    _ChatMessage(
      text: 'Hi Ahmed, how can I help?',
      fromUser: false,
    ),
    _ChatMessage(
      text: 'Request annual leave for next Thursday',
      fromUser: true,
    ),
    _ChatMessage(
      text: 'I will request annual leave, Thu 3 Jul, 1 day. Confirm to submit?',
      fromUser: false,
      showActions: true,
    ),
    _ChatMessage(
      text: 'How many annual days do I have left?',
      fromUser: true,
    ),
    _ChatMessage(
      text: 'You have 18 annual days remaining, plus 6 sick days.',
      fromUser: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.72,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sheetHandle(),

            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppGradients.brand,
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: AppColors.buttonText,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AI Assistant',
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Voice / agentic assistant',
                        style: TextStyle(
                          color: AppColors.text2,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: AppColors.text2),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.separated(
                itemCount: _messages.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _ChatBubble(message: message);
                },
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _QuickActionChip(
                  text: 'My balance',
                  onTap: () => _sendQuickMessage('My balance'),
                ),
                _QuickActionChip(
                  text: 'Where is my correction?',
                  onTap: () => _sendQuickMessage('Where is my correction?'),
                ),
                _QuickActionChip(
                  text: 'Book leave',
                  onTap: () => _sendQuickMessage('Book leave'),
                ),
              ],
            ),

            const SizedBox(height: 12),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _listening ? _listeningBox() : _inputBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sheetHandle() {
    return Center(
      child: Container(
        width: 42,
        height: 4,
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: AppColors.line,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _inputBox() {
    return Container(
      key: const ValueKey('input'),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.panel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: AppColors.text),
              decoration: const InputDecoration(
                hintText: 'Ask or speak...',
                border: InputBorder.none,
                isDense: true,
              ),
              onSubmitted: (_) => _sendTextMessage(),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => _listening = true);
            },
            icon: const Icon(
              Icons.mic_none,
              color: AppColors.cyan,
            ),
          ),
          IconButton(
            onPressed: _sendTextMessage,
            icon: const Icon(
              Icons.send_rounded,
              color: AppColors.cyan,
              size: 21,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listeningBox() {
    return Container(
      key: const ValueKey('listening'),
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cyan.withOpacity(0.10),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cyan.withOpacity(0.35)),
      ),
      child: Column(
        children: [
          const Icon(Icons.mic, color: AppColors.cyan, size: 30),
          const SizedBox(height: 8),
          const Text(
            'Listening...',
            style: TextStyle(
              color: AppColors.cyan,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Say something like “Request annual leave for Thursday”',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.text2, fontSize: 12),
          ),
          const SizedBox(height: 10),
          GhostButton(
            text: 'Stop',
            height: 38,
            onPressed: () {
              setState(() => _listening = false);
            },
          ),
        ],
      ),
    );
  }

  void _sendQuickMessage(String text) {
    setState(() {
      _messages.add(_ChatMessage(text: text, fromUser: true));

      if (text == 'My balance') {
        _messages.add(
          _ChatMessage(
            text: 'You have 18 annual days, 6 sick days, and 4 hours short leave available.',
            fromUser: false,
          ),
        );
      } else if (text == 'Where is my correction?') {
        _messages.add(
          _ChatMessage(
            text: 'Your correction for Mon 29 Jun is awaiting manager approval.',
            fromUser: false,
          ),
        );
      } else {
        _messages.add(
          _ChatMessage(
            text: 'I can help you prepare a leave request. Please choose leave type and date.',
            fromUser: false,
          ),
        );
      }
    });
  }

  void _sendTextMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_ChatMessage(text: text, fromUser: true));
      _messages.add(
        _ChatMessage(
          text: 'I received your request. In the real app this will connect to the authenticated HR workflow.',
          fromUser: false,
        ),
      );
      _controller.clear();
    });
  }
}

class _ChatMessage {
  final String text;
  final bool fromUser;
  final bool showActions;

  const _ChatMessage({
    required this.text,
    required this.fromUser,
    this.showActions = false,
  });
}

class _ChatBubble extends StatelessWidget {
  final _ChatMessage message;

  const _ChatBubble({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final alignment =
    message.fromUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Row(
          mainAxisAlignment:
          message.fromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!message.fromUser) ...[
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.brand,
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  size: 15,
                  color: AppColors.buttonText,
                ),
              ),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: message.fromUser
                      ? AppColors.cyan.withOpacity(0.18)
                      : AppColors.panel2,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(
                    color: message.fromUser
                        ? AppColors.cyan.withOpacity(0.22)
                        : AppColors.line,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.text,
                      style: const TextStyle(
                        color: AppColors.text,
                        fontSize: 13,
                        height: 1.45,
                      ),
                    ),
                    if (message.showActions) ...[
                      const SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _ActionButton(
                            text: 'Confirm',
                            color: AppColors.cyan,
                            onTap: () {
                              showAppToast(context, 'Leave request submitted');
                            },
                          ),
                          const SizedBox(width: 8),
                          _ActionButton(
                            text: 'Cancel',
                            color: AppColors.badText,
                            onTap: () {
                              showAppToast(context, 'Request cancelled');
                            },
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickActionChip extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _QuickActionChip({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(text),
      onPressed: onTap,
      backgroundColor: Colors.transparent,
      side: const BorderSide(color: AppColors.line),
      labelStyle: const TextStyle(
        color: AppColors.text,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(7),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(
          color: color.withOpacity(0.16),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}