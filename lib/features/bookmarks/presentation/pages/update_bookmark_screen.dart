import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/bookmark.dart';
import '../providers/bookmark_provider.dart';

class UpdateBookmarkScreen extends StatelessWidget {
  final Bookmark bookmark;
  final TextEditingController titleController;
  final TextEditingController urlController;
  final TextEditingController collectionIdController;

  UpdateBookmarkScreen({super.key, required this.bookmark})
      : titleController = TextEditingController(text: bookmark.title),
        urlController = TextEditingController(text: bookmark.url),
        collectionIdController =
            TextEditingController(text: bookmark.collectionId.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Bookmark'),
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
                final updatedBookmark = Bookmark(
                  id: bookmark.id,
                  title: titleController.text,
                  url: urlController.text,
                  collectionId: int.parse(collectionIdController.text),
                );
                Provider.of<BookmarkProvider>(context, listen: false)
                    .updateBookmark(updatedBookmark);
                Navigator.pop(context);
              },
              child: const Text('Update Bookmark'),
            ),
          ],
        ),
      ),
    );
  }
}
