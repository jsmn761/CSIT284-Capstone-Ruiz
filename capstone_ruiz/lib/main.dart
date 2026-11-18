import 'package:flutter/material.dart';
import 'package:capstone_ruiz/screens/announcement_screen.dart';

void main() {
   runApp(const CampusBulletinApp());
}

class CampusBulletinApp extends StatelessWidget {
  const CampusBulletinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Campus Bulletin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF800000),
          ),
        ),
        home: const AnnouncementScreen(),
    );
  }
}