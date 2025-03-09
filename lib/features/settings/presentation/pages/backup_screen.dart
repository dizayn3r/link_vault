import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart'; // For formatting the date
import 'package:link_vault/features/settings/data/models/backup.dart';
import 'package:provider/provider.dart';

import '../providers/backup_provider.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  // Format the backup time
  String _formatBackupTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, HH:mm:ss a').format(dateTime);
  }

  // Format the file size in a human-readable format
  String _formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    }
  }

  Future<void> _confirmDeleteBackup(
    BuildContext context,
    BackupModel backup,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Backup'),
        content: const Text('Are you sure you want to delete this backup?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await context.read<BackupProvider>().deleteBackup(context, backup);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backup & Restore'),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<BackupProvider>().exportDatabase(context);
            },
            icon: const Icon(
              FontAwesomeIcons.fileExport,
              size: 16.0,
            ),
          ),
        ],
      ),
      body: Consumer<BackupProvider>(
        builder: (context, backupProvider, child) {
          if (backupProvider.backups.isEmpty) {
            return const Center(child: Text('No backups found.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: backupProvider.backups.length,
            itemBuilder: (context, index) {
              final backup = backupProvider.backups[index];

              return Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Created DateTime and File Size
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _formatBackupTime(backup.createdDate),
                          ),
                          Text(
                            'Size: ${_formatFileSize(backup.fileSize)}',
                          ),
                        ],
                      ),
                      Spacer(),

                      // Restore
                      IconButton(
                        icon: const Icon(Icons.restore),
                        onPressed: () async {
                          await backupProvider.importDatabase(
                            context,
                            backup.filePath,
                          );
                        },
                      ),

                      // Delete
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await _confirmDeleteBackup(context, backup);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
