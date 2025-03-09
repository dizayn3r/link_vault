import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/tag.dart';
import '../providers/tag_provider.dart';

class AddTagScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  AddTagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Tag'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final tag = Tag(
                  name: nameController.text,
                );
                Provider.of<TagProvider>(context, listen: false).addTag(tag);
                Navigator.pop(context);
              },
              child: const Text('Add Tag'),
            ),
          ],
        ),
      ),
    );
  }
}
