import 'package:flutter/material.dart';
import 'package:link_vault/features/tags/presentation/pages/view_tag_screen.dart';

import '../../../tags/domain/entities/tag.dart';

class TagListItem extends StatelessWidget {
  final Tag tag;

  const TagListItem({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewTagScreen(tag: tag),
            ),
          );
        },
        title: Text(
          "#${tag.name}",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
