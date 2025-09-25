import 'package:flutter/material.dart';
import 'profile_section.dart';
import 'projects_section.dart';
import 'skills_section.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;
  HomeScreen({required this.isDark, required this.onToggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  // 🔑 Keys for each section
  final _profileKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _skillsKey = GlobalKey();

  // Smooth scroll helper
  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _openContactSheet() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          16,
          20,
          MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Wrap(
          runSpacing: 12,
          children: [
            Center(
              child: Container(height: 4, width: 80, color: Colors.white24),
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                "Let's Create Something Amazing",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () =>
                      _launchUrl('https://github.com/zyl-ann/My-Portfolio'),
                  icon: const Icon(Icons.code),
                  label: const Text('GitHub'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () => _launchUrl('https://www.linkedin.com/'),
                  icon: const Icon(Icons.business),
                  label: const Text('LinkedIn'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () =>
                      _launchUrl('mailto:christzylcasino@gmail.com'),
                  icon: const Icon(Icons.email),
                  label: const Text('Email'),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot open link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/USTP.png'),
            ),
            const SizedBox(width: 8),
            const Text('Creative Portfolio'),
            const Spacer(),
            IconButton(
              icon: Icon(
                widget.isDark ? Icons.brightness_3 : Icons.wb_sunny_outlined,
              ),
              onPressed: widget.onToggleTheme,
            ),
            IconButton(
              icon: const Icon(Icons.grid_view),
              onPressed: () => showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (c) => Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('About Me'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.pop(context);
                          _scrollTo(_profileKey);
                        },
                      ),
                      ListTile(
                        title: const Text('Projects'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.pop(context);
                          _scrollTo(_projectsKey);
                        },
                      ),
                      ListTile(
                        title: const Text('Skills'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.pop(context);
                          _scrollTo(_skillsKey);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        centerTitle: false,
        toolbarHeight: 56,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: widget.isDark
              ? null
              : const LinearGradient(
                  colors: [Color(0xFFF7F6FB), Color(0xFFEFE8FF)],
                ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                Container(key: _profileKey, child: ProfileSection()),
                const SizedBox(height: 14),
                Container(key: _projectsKey, child: ProjectsSection()),
                const SizedBox(height: 14),
                Container(key: _skillsKey, child: SkillsSection()),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openContactSheet,
        label: const Text("Contact Me"),
        icon: const Icon(Icons.send),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

