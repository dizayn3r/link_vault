import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/bookmark.dart';
import '../providers/bookmark_provider.dart';

class AddBookmarkScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController collectionIdController = TextEditingController();

  AddBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bookmark'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(labelText: 'URL'),
            ),
            TextField(
              controller: collectionIdController,
              decoration: const InputDecoration(labelText: 'Collection ID'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final bookmark = Bookmark(
                  title: titleController.text,
                  url: urlController.text,
                  collectionId: int.parse(collectionIdController.text),
                );
                Provider.of<BookmarkProvider>(context, listen: false)
                    .addBookmark(bookmark);
                Navigator.pop(context);
              },
              child: const Text('Add Bookmark'),
            ),
          ],
        ),
      ),
    );
  }
}
