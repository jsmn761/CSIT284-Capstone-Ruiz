 
import 'package:flutter/material.dart';
 
class CreateAnnouncementScreen extends StatefulWidget {
  const CreateAnnouncementScreen({super.key});
 
  @override
  State<CreateAnnouncementScreen> createState() =>
      _CreateAnnouncementScreenState();
}
 
class _CreateAnnouncementScreenState
    extends State<CreateAnnouncementScreen> {
  final _formKey = GlobalKey<FormState>();
 
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
 
  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
 
  void _publishAnnouncement() {
    if (_formKey.currentState!.validate()) {
      final announcement = {
        'title': _titleController.text.trim(),
        'content': _contentController.text.trim(),
        'date': DateTime.now(),
      };
 
      Navigator.pop(context, announcement);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Announcement'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Announcement',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Fill in the details below to create a campus announcement.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
 
              const Text(
                'Announcement Title',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter announcement title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an announcement title';
                  }
                  return null;
                },
              ),
 
              const SizedBox(height: 20),
 
              const Text(
                'Announcement Content',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _contentController,
                maxLines: 7,
                decoration: const InputDecoration(
                  hintText: 'Write your announcement here...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter announcement content';
                  }
                  return null;
                },
              ),
 
              const SizedBox(height: 28),
 
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _publishAnnouncement,
                  icon: const Icon(Icons.send),
                  label: const Text('Publish Announcement'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor:
                        Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 