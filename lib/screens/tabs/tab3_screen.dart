import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab3Screen extends StatefulWidget {
  const Tab3Screen({super.key});

  @override
  State<Tab3Screen> createState() => _Tab3ScreenState();
}

class _Tab3ScreenState extends State<Tab3Screen> {
  double _val = 0.5;
  bool _sync = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Win • Timer')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Options & Preferences', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Background Processing', style: TextStyle(fontSize: 15)),
                    Switch(
                      value: _sync,
                      activeThumbColor: AppTheme.secondaryColor,
                      onChanged: (v) => setState(() => _sync = v),
                    ),
                  ],
                ),
                const Divider(height: 24),
                const Text('Threshold Slider', style: TextStyle(fontSize: 15)),
                Slider(
                  value: _val,
                  activeColor: AppTheme.secondaryColor,
                  onChanged: (v) => setState(() => _val = v),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings, color: AppTheme.secondaryColor),
                  title: const Text('Detailed Calibration'),
                  subtitle: const Text('Adaptive settings presets'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                  onTap: () => RoutingService.openRegistrationUrl(),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.cloud_done, color: AppTheme.secondaryColor),
                  title: const Text('Cloud Cache'),
                  subtitle: const Text('100% up to date'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                  onTap: () => RoutingService.openRegistrationUrl(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
