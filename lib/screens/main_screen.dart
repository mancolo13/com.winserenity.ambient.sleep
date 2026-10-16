import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'tabs/tab1_screen.dart';
import 'tabs/tab2_screen.dart';
import 'tabs/tab3_screen.dart';
import 'tabs/tab4_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Tab3Screen(),
    Tab2Screen(),
    Tab4Screen(),
    Tab1Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppTheme.surfaceColor,
        indicatorColor: AppTheme.primaryColor.withValues(alpha: 0.2),
        destinations: [
        NavigationDestination(
          icon: const Icon(Icons.bedtime_outlined),
          selectedIcon: const Icon(Icons.bedtime, color: AppTheme.primaryColor),
          label: 'Timer',
        ),
        NavigationDestination(
          icon: const Icon(Icons.graphic_eq_outlined),
          selectedIcon: const Icon(Icons.graphic_eq, color: AppTheme.primaryColor),
          label: 'Waves',
        ),
        NavigationDestination(
          icon: const Icon(Icons.book_outlined),
          selectedIcon: const Icon(Icons.book, color: AppTheme.primaryColor),
          label: 'Journal',
        ),
        NavigationDestination(
          icon: const Icon(Icons.nights_stay_outlined),
          selectedIcon: const Icon(Icons.nights_stay, color: AppTheme.primaryColor),
          label: 'Ambience',
        ),
        ],
      ),
    );
  }
}
