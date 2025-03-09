import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/collection.dart';
import '../providers/collection_provider.dart';

class UpdateCollectionScreen extends StatelessWidget {
  final Collection collection;
  final TextEditingController nameController;

  UpdateCollectionScreen({super.key, required this.collection})
      : nameController = TextEditingController(text: collection.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Collection'),
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
                final updatedCollection = Collection(
                  id: collection.id,
                  name: nameController.text,
                );
                Provider.of<CollectionProvider>(context, listen: false)
                    .updateCollection(updatedCollection);
                Navigator.pop(context);
              },
              child: const Text('Update Collection'),
            ),
          ],
        ),
      ),
    );
  }
}
