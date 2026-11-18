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

    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnnouncementDetailScreen(),
              ),
          );
        }, 
        
        child: const Text('View Announcement'),
     ),
    ),
   );
  }
}