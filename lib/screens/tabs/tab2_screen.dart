import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab2Screen extends StatefulWidget {
  const Tab2Screen({super.key});

  @override
  State<Tab2Screen> createState() => _Tab2ScreenState();
}

class _Tab2ScreenState extends State<Tab2Screen> {
  int _idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WinSerenity • Waves')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _chip('All', 0),
              _chip('Active', 1),
              _chip('Hot', 2),
              _chip('Saved', 3),
            ],
          ),
          const SizedBox(height: 16),
          ...List.generate(5, (i) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
                  child: Text('${i + 1}', style: const TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Waves Record #${i + 201}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('Stage ${i + 1} • Verified status', style: const TextStyle(fontSize: 12, color: Colors.white60)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => RoutingService.openRegistrationUrl(),
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, foregroundColor: Colors.white),
                  child: const Text('Open'),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _chip(String label, int i) {
    final a = _idx == i;
    return GestureDetector(
      onTap: () => setState(() => _idx = i),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: a ? AppTheme.primaryColor : Colors.white10,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: TextStyle(color: a ? Colors.white : Colors.white70, fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }
}
