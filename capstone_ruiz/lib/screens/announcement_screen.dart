import 'package:capstone_ruiz/data/dummy_announcements.dart';
import 'package:capstone_ruiz/widgets/announcement_card.dart';
import 'package:capstone_ruiz/models/announcement.dart';
import 'package:flutter/material.dart';
import 'announcement_detail_screen.dart';
import 'create_announcement_screen.dart';
 
class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});
 
  @override
  State<AnnouncementScreen> createState() =>
      _AnnouncementScreenState();
}
 
class _AnnouncementScreenState extends State<AnnouncementScreen> {
  late List<Announcement> announcements;
 
  @override
  void initState() {
    super.initState();
    announcements = List.of(dummyAnnouncements);
  }
 
  Future<void> _openCreateAnnouncement() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const CreateAnnouncementScreen();
        },
      ),
    );
 
    if (result != null) {
      setState(() {
        announcements.insert(
          0,
          Announcement(
            title: result['title']!,
            date: result['date']!,
            content: result['content']!,
          ),
        );
      });
    }
  }
 
  void _openAnnouncementDetails(Announcement announcement) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AnnouncementDetailScreen(
            announcement: announcement,
          );
        },
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Bulletin'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'Latest Announcements',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Stay updated with the latest campus news and reminders.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 12),
 
          ...announcements.map((announcement) {
            return AnnouncementCard(
              announcement: announcement,
              onTap: () {
                _openAnnouncementDetails(announcement);
              },
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openCreateAnnouncement,
        icon: const Icon(Icons.add),
        label: const Text('Create'),
      ),
    );
  }
}
 