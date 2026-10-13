import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Win • Journal')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
                  child: const Icon(Icons.person, size: 40, color: AppTheme.primaryColor),
                ),
                const SizedBox(height: 12),
                const Text('Account Active', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text('Tier: Pro Member', style: TextStyle(color: AppTheme.secondaryColor, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                _tile(Icons.shield_outlined, 'Privacy Terms'),
                const Divider(),
                _tile(Icons.support_agent, 'Help Center'),
                const Divider(),
                _tile(Icons.star_rate_outlined, 'Feedback'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => RoutingService.openRegistrationUrl(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            child: const Text('Upgrade Pro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _tile(IconData ic, String t) {
    return ListTile(
      leading: Icon(ic, color: Colors.white70),
      title: Text(t),
      trailing: const Icon(Icons.chevron_right, color: Colors.white38),
      onTap: () => RoutingService.openRegistrationUrl(),
    );
  }
}
