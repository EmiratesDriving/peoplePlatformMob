import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';
import 'person_profile_screen.dart';

class DirectoryScreen extends StatefulWidget {
  const DirectoryScreen({super.key});

  @override
  State<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  int view = 0;
  bool showManager = true;
  bool showSupervisor = true;
  String query = '';

  final people = const [
    ('Thomas Hayward', 'Manager · IT'),
    ('Emily Drake', 'Supervisor · IT'),
    ('Ahmed Al Mansoori', 'Middleware Specialist · IT'),
    ('Hannah Frost', 'Specialist · IT'),
  ];

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Directory',
            child: ScreenPad(
        child: Column(
          children: [
            SegmentedButton<int>(
              segments: const [ButtonSegment(value: 0, label: Text('Directory')), ButtonSegment(value: 1, label: Text('Org chart'))],
              selected: {view},
              onSelectionChanged: (value) => setState(() => view = value.first),
            ),
            const SizedBox(height: 12),
            if (view == 0) _directoryView(context) else _orgView(),
          ],
        ),
      ),
    );
  }

  Widget _directoryView(BuildContext context) {
    final filtered = people.where((p) => p.$1.toLowerCase().contains(query.toLowerCase())).toList();
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(hintText: 'Search people…', prefixIcon: Icon(Icons.search)),
          onChanged: (value) => setState(() => query = value),
        ),
        const SizedBox(height: 12),
        EMCCard(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Column(
            children: filtered.map<Widget>((p) {
              return ListRow(
                                icon: Icons.person_outline,
                title: p.$1,
                subtitle: p.$2,
                trailing: const Icon(Icons.chevron_right, color: AppColors.text3),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PersonProfileScreen(name: p.$1, role: p.$2)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _orgView() {
    return Column(
      children: [
        EMCCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => setState(() => showManager = !showManager),
                child: Row(
                  children: [
                    const Expanded(child: Text('Thomas Hayward · Manager', style: TextStyle(fontWeight: FontWeight.w900))),
                    Icon(showManager ? Icons.keyboard_arrow_down : Icons.chevron_right, color: AppColors.text3),
                  ],
                ),
              ),
              if (showManager)
                Container(
                  margin: const EdgeInsets.only(left: 12, top: 10),
                  padding: const EdgeInsets.only(left: 12),
                  decoration: const BoxDecoration(border: Border(left: BorderSide(color: AppColors.line))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => setState(() => showSupervisor = !showSupervisor),
                        child: Row(
                          children: [
                            const Expanded(child: Text('Emily Drake · Supervisor')),
                            Icon(showSupervisor ? Icons.keyboard_arrow_down : Icons.chevron_right, color: AppColors.text3),
                          ],
                        ),
                      ),
                      if (showSupervisor)
                        Container(
                          margin: const EdgeInsets.only(left: 12, top: 8),
                          padding: const EdgeInsets.only(left: 12),
                          decoration: const BoxDecoration(border: Border(left: BorderSide(color: AppColors.line))),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.symmetric(vertical: 6), child: Text('Ahmed Al Mansoori')),
                              Padding(padding: EdgeInsets.symmetric(vertical: 6), child: Text('Hannah Frost')),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const FutureBanner(
          icon: Icons.lightbulb_outline,
          title: 'Org chart',
          description: 'Tap a node to expand or collapse. Real version reads the live hierarchy used by approval routing.',
        ),
      ],
    );
  }
}
