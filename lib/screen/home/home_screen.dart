import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class HomeScreen extends StatefulWidget {
  final bool correctionRequested;
  final VoidCallback onAttendanceAttention;
  final VoidCallback onLeaveTap;

  const HomeScreen({
    super.key,
    required this.correctionRequested,
    required this.onAttendanceAttention,
    required this.onLeaveTap,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool checkedIn = false;
  String message = '';

  @override
  Widget build(BuildContext context) {
    return ScreenPad(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Good morning, Ahmed', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900)),
          const SizedBox(height: 2),
          const Text('Tuesday, 30 June 2026', style: TextStyle(color: AppColors.text2, fontSize: 13)),
          const SizedBox(height: 16),
          _PunchCard(checkedIn: checkedIn, message: message, onPunch: _punch),
          _TodayCard(checkedIn: checkedIn),
          EMCCard(
            onTap: widget.onLeaveTap,
            child: const Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text('Leave balance', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900))),
                    Icon(Icons.chevron_right, color: AppColors.text3),
                  ],
                ),
                SizedBox(height: 11),
                Stat3(items: [StatItem('18', 'Annual'), StatItem('6', 'Sick'), StatItem('4h', 'Short')]),
              ],
            ),
          ),
          EMCCard(
            onTap: widget.onAttendanceAttention,
            backgroundColor: AppColors.warnBg,
            borderColor: const Color(0xFF3A3010),
            child: Row(
              children: [
                const Icon(Icons.warning_amber_outlined, color: AppColors.warn, size: 22),
                const SizedBox(width: 11),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.correctionRequested ? 'Correction pending' : '1 missing punch',
                        style: const TextStyle(color: AppColors.warn, fontSize: 13.5, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.correctionRequested ? 'Mon 29 Jun · awaiting manager' : 'Mon 29 Jun needs a correction',
                        style: const TextStyle(color: Color(0xFFC79A3A), fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: AppColors.warn),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _punch() {
    setState(() {
      checkedIn = !checkedIn;
      message = checkedIn ? 'Checked in at 08:12, EMC HQ' : 'Checked out at 17:24';
    });
  }
}

class _PunchCard extends StatelessWidget {
  final bool checkedIn;
  final String message;
  final VoidCallback onPunch;

  const _PunchCard({required this.checkedIn, required this.message, required this.onPunch});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.cyan.withOpacity(.14), AppColors.aqua.withOpacity(.05)],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.cyan.withOpacity(.30)),
      ),
      child: Column(
        children: [
          const Text('You\'re currently', style: TextStyle(color: AppColors.cyan, fontSize: 13)),
          const SizedBox(height: 3),
          Text(checkedIn ? 'Checked in' : 'Checked out', style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w900)),
          const SizedBox(height: 16),
          SizedBox(
            width: 142,
            height: 142,
            child: DecoratedBox(
              decoration: const BoxDecoration(shape: BoxShape.circle, gradient: AppGradients.brand),
              child: ElevatedButton(
                onPressed: onPunch,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: AppColors.buttonText,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(checkedIn ? Icons.logout : Icons.fingerprint, size: 40),
                    const SizedBox(height: 5),
                    Text(checkedIn ? 'Check out' : 'Check in', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(message, style: const TextStyle(color: AppColors.cyan, fontSize: 12)),
        ],
      ),
    );
  }
}

class _TodayCard extends StatelessWidget {
  final bool checkedIn;

  const _TodayCard({required this.checkedIn});

  @override
  Widget build(BuildContext context) {
    return EMCCard(
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(child: Text('Today', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900))),
              Text('Tue 30 Jun', style: TextStyle(color: AppColors.text2, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 11),
          Stat3(
            items: [
              StatItem(checkedIn ? '08:12' : '—', 'First in'),
              StatItem(checkedIn ? '—' : '17:24', 'Last out'),
              StatItem(checkedIn ? 'Open' : '8.7', 'Hours'),
            ],
          ),
        ],
      ),
    );
  }
}
