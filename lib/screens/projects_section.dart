import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Web Design',
      'desc':
          'A comprehensive Webdesign for enhancing personal knowledge and experience.',
      'image': 'assets/images/eco_tracker.png',
      'status': 'Completed',
      'tags': ['HTML', 'CSS'],
    },
    {
      'title': 'Animated Web Design',
      'desc':
          'Modern project management dashboard built with Node.js and Reactjs.',
      'image': 'assets/images/taskflow.png',
      'status': 'Completed',
      'tags': ['React.js', 'Node.js', 'HTML', 'CSS'],
    },
    {
      'title': 'Library Management System',
      'desc':
          'Cross-platform LMS for tracking borrowers and enhance user experience.',
      'image': 'assets/images/fitnesspal.png',
      'status': 'Planning',
      'tags': ['JavaFX', 'MySQL'],
    },
    {
      'title': 'Mobile Developing / Programming',
      'desc': 'Developing Single Page Portfolio with simple features.',
      'image': 'assets/images/linkage.png',
      'status': 'In Progress',
      'tags': ['Flutter', 'Dart'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Creative Projects', style: theme.textTheme.titleLarge),
        const SizedBox(height: 8),
        Text('Innovative solutions that make a difference',
            style: theme.textTheme.bodyMedium),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isWide ? 2 : 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isWide ? 1.4 : 1.1,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final p = projects[index];
                return _projectCard(context, p);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _projectCard(BuildContext context, Map<String, dynamic> project) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            project['image'],
            fit: BoxFit.cover,
          ),
          // Gradient overlay for readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.7),
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.2),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status badge
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      project['status'] ?? '',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  project['title'] ?? '',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  project['desc'] ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                      ),
                ),
                const SizedBox(height: 10),
                if (project['tags'] != null)
                  Wrap(
                    spacing: 8,
                    children: (project['tags'] as List<String>).map((tag) {
                      return Chip(
                        label: Text(tag),
                        backgroundColor: Colors.black54,
                        labelStyle: const TextStyle(color: Colors.white),
                      );
                    }).toList(),
                  ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    backgroundColor: Colors.white.withOpacity(0.9),
                    foregroundColor: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Explore'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
