import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/labelled_textfield.dart';
import '../../domain/entities/tag.dart';
import '../providers/tag_provider.dart';

class ViewTagScreen extends StatefulWidget {
  final Tag tag;

  const ViewTagScreen({super.key, required this.tag});

  @override
  _ViewTagScreenState createState() => _ViewTagScreenState();
}

class _ViewTagScreenState extends State<ViewTagScreen> {
  late TextEditingController nameController;
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.tag.name);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tagProvider = Provider.of<TagProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Tag' : 'View Tag'),
        actions: [
          IconButton(
            icon: Icon(isEditMode ? Icons.save : Icons.edit),
            onPressed: () {
              if (isEditMode) {
                // Save changes
                final updatedTag = Tag(
                  id: widget.tag.id,
                  name: nameController.text,
                );
                tagProvider.updateTag(updatedTag);
                Navigator.pop(context);
              }
              toggleEditMode(); // Toggle edit mode
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              tagProvider.deleteTag(widget.tag);
              Navigator.pop(context); // Navigate back after deletion
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LabelledTextField(
              controller: nameController,
              label: "Tag",
              hintText: "Enter a tag",
              readOnly: isEditMode,
            ),
            const SizedBox(height: 20),
            if (isEditMode)
              ElevatedButton(
                onPressed: () {
                  final updatedTag = Tag(
                    id: widget.tag.id,
                    name: nameController.text,
                  );
                  tagProvider.updateTag(updatedTag);
                  Navigator.pop(context); // Navigate back after saving
                },
                child: const Text('Save Changes'),
              ),
          ],
        ),
      ),
    );
  }
}
