import 'package:flutter/material.dart';
import '../widgets/custom_image_widget.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: theme.brightness == Brightness.dark
            ? const LinearGradient(
                colors: [Color(0xFF2B1238), Color(0xFF3A2046)])
            : const LinearGradient(
                colors: [Color(0xFFFEEFF6), Color(0xFFE7F3FF)]),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          const CustomImageWidget(
              assetPath: 'assets/images/profile_placeholder.png', size: 100),
          const SizedBox(height: 12),
          Text('Christzyl Ann Casiño', style: theme.textTheme.titleLarge),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: theme.colorScheme.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text('BSIT - 3C', style: theme.textTheme.bodySmall),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: theme.cardColor.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Enhancing skills and exploring opportunities in mobile development using Flutter and Dart.',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statItem('4', 'Projects'),
              _statItem('3', 'Years'),
              _statItem('3', 'Completed'),
            ],
          )
        ],
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
