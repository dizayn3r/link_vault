import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/collection_provider.dart';
import 'add_collection_screen.dart';
import 'update_collection_screen.dart';

class CollectionListScreen extends StatelessWidget {
  const CollectionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final collectionProvider = Provider.of<CollectionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCollectionScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: collectionProvider.collections.length,
        itemBuilder: (context, index) {
          final collection = collectionProvider.collections[index];
          return ListTile(
            title: Text(collection.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateCollectionScreen(collection: collection),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    collectionProvider.deleteCollection(collection);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
