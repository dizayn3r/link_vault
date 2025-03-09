import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/collection.dart';
import '../providers/collection_provider.dart';

class AddCollectionScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  AddCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Collection'),
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
                final collection = Collection(
                  name: nameController.text,
                );
                Provider.of<CollectionProvider>(context, listen: false)
                    .addCollection(collection);
                Navigator.pop(context);
              },
              child: const Text('Add Collection'),
            ),
          ],
        ),
      ),
    );
  }
}
