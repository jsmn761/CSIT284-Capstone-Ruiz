import 'package:capstone_ruiz/data/dummy_announcements.dart';
import 'package:capstone_ruiz/widgets/announcement_card.dart';
import 'package:flutter/material.dart';
import 'announcement_detail_screen.dart';

class AnnouncementScreen extends StatelessWidget {
    const AnnouncementScreen({super.key});

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
          padding: EdgeInsetsGeometry.fromLTRB(16, 24, 16, 8),
          child: Text('Latest Announcements',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          ),
          ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16),
            child: Text(
              'Stay updated with the latest campus news and reminders.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 12
          ),
          ...dummyAnnouncements.map((announcement){
            return AnnouncementCard(
              announcement: announcement, 
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) {
                  return AnnouncementDetailScreen(announcement: announcement,
                  );
                },
                ),
                );
              },
              );
          }),
      ],
    ),
   );
  }
}