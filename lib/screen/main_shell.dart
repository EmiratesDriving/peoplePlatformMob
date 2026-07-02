import 'package:flutter/material.dart';

import 'attendance/attendance_day_screen.dart';
import 'attendance/attendance_screen.dart';
import 'attendance/correction_request_screen.dart';
import 'home/home_screen.dart';
import 'leave/leave_screen.dart';
import 'more/more_screen.dart';
import 'notifications/notifications_screen.dart';
import 'theme/app_theme.dart';
import 'widgets/ai_assistant_fab.dart';
import 'widgets/app_logo.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;
  bool correctionRequested = false;

  String get title {
    switch (index) {
      case 0:
        return 'People Platform';
      case 1:
        return 'Attendance';
      case 2:
        return 'Leave';
      case 3:
        return 'More';
      default:
        return 'People Platform';
    }
  }

  String? get subtitle {
    if (index == 0) {
      return 'EMC';
    }
    return null;
  }

  void goHome() {
    setState(() {
      index = 0;
    });
  }

  void openAttendanceDay() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AttendanceDayScreen(
          correctionRequested: correctionRequested,
          onRequestCorrection: openCorrection,
        ),
      ),
    );
  }

  void openCorrection() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CorrectionRequestScreen(
          onSubmitted: () {
            setState(() {
              correctionRequested = true;
            });
          },
        ),
      ),
    );
  }

  void openNotifications() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const NotificationsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomeScreen(
        correctionRequested: correctionRequested,
        onAttendanceAttention: openAttendanceDay,
        onLeaveTap: () {
          setState(() {
            index = 2;
          });
        },
      ),
      AttendanceScreen(
        correctionRequested: correctionRequested,
        onDayTap: openAttendanceDay,
        onCorrection: openCorrection,
      ),
      const LeaveScreen(),
      const MoreScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.appBackground,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 14,
        backgroundColor: AppColors.appBackground,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: goHome,
              child: const AppLogo(size: 30),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.text3,
                        fontSize: 10,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: openNotifications,
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: AppColors.text2,
                ),
                Positioned(
                  right: -3,
                  top: -3,
                  child: Container(
                    width: 15,
                    height: 15,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.bad,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: AppColors.line,
          ),
        ),
      ),

      body: IndexedStack(
        index: index,
        children: pages,
      ),

      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: AppColors.appBackground,
          indicatorColor: AppColors.cyan.withOpacity(0.14),
          labelTextStyle: WidgetStateProperty.resolveWith(
                (states) => TextStyle(
              color: states.contains(WidgetState.selected)
                  ? AppColors.cyan
                  : AppColors.text3,
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconTheme: WidgetStateProperty.resolveWith(
                (states) => IconThemeData(
              color: states.contains(WidgetState.selected)
                  ? AppColors.cyan
                  : AppColors.text3,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) {
            setState(() {
              index = value;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.access_time),
              selectedIcon: Icon(Icons.access_time_filled),
              label: 'Attendance',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'Leave',
            ),
            NavigationDestination(
              icon: Icon(Icons.more_horiz),
              selectedIcon: Icon(Icons.more),
              label: 'More',
            ),
          ],
        ),
      ),

      floatingActionButton: const AiAssistantFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}