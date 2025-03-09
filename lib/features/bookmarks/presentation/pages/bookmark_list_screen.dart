import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bookmark_provider.dart';
import 'add_bookmark_screen.dart';

class BookmarkListScreen extends StatefulWidget {
  const BookmarkListScreen({super.key});

  @override
  State<BookmarkListScreen> createState() => _BookmarkListScreenState();
}

class _BookmarkListScreenState extends State<BookmarkListScreen> {
  @override
  void initState() {
    final bookmarkProvider =
        Provider.of<BookmarkProvider>(context, listen: false);
    bookmarkProvider.fetchBookmarks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBookmarkScreen()),
              );
            },
          ),
        ],
      ),
      body: bookmarkProvider.bookmarks.isEmpty
          ? const Center(child: Text('No bookmarks found'))
          : ListView.builder(
              itemCount: bookmarkProvider.bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = bookmarkProvider.bookmarks[index];
                return ListTile(
                  title: Text(bookmark.title),
                  subtitle: Text(bookmark.url),
                );
              },
            ),
    );
  }
}
