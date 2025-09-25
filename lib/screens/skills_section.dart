import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  final List<_Skill> skills = [
    _Skill('Flutter & Dart', 0.40),
    _Skill('Java', 0.85),
    _Skill('HTML/CSS', 0.88),
    _Skill('Git & GitHub', 0.32),
    _Skill('Python', 0.78),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills & Expertise', style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          ...skills.map((s) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _skillRow(context, s),
              )),
        ],
      ),
    );
  }

  Widget _skillRow(BuildContext context, _Skill s) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(s.name, style: theme.textTheme.titleMedium),
            const Spacer(),
            Text('${(s.level * 100).round()}%',
                style: theme.textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            minHeight: 10,
            value: s.level,
            backgroundColor: Colors.white12,
            valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

class _Skill {
  final String name;
  final double level;
  _Skill(this.name, this.level);
}
