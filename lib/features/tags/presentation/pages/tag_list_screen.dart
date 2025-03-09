import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../collections/presentation/widgets/tag_list_item.dart';
import '../providers/tag_provider.dart';
import 'add_tag_screen.dart';

class TagListScreen extends StatelessWidget {
  const TagListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tags'),
      ),
      body: Consumer<TagProvider>(
        builder: (context, tagProvider, child) {
          if (tagProvider.errorMessage != null) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                tagProvider.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return tagProvider.tags.isEmpty
              ? const Center(child: Text('No tags found'))
              : ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: tagProvider.tags.length,
                  itemBuilder: (context, index) {
                    final tag = tagProvider.tags[index];
                    return TagListItem(tag: tag);
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTagScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
