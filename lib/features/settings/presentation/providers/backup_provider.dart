import 'dart:io';

import 'package:flutter/material.dart';
import 'package:link_vault/core/services/backup_service.dart';
import 'package:path/path.dart';

import '../../data/models/backup.dart';

class BackupProvider with ChangeNotifier {
  List<BackupModel> _backups = [];

  List<BackupModel> get backups => _backups;

  // Fetch backups from storage
  Future<void> fetchBackups() async {
    final backupFiles = await BackupService.listBackups();
    _backups = await Future.wait(
      backupFiles.map((file) async {
        final fileStat = await file.stat();
        return BackupModel(
          fileName: basename(file.path), // File name
          filePath: file.path, // Full file path
          createdDate: fileStat.modified, // Creation date
          fileSize: fileStat.size, // File size
        );
      }),
    );
    notifyListeners();
  }

  // Export database and refresh backups list
  Future<void> exportDatabase(BuildContext context) async {
    try {
      await BackupService.exportDatabase();
      await fetchBackups(); // Refresh the backups list
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Database exported successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Import database from a backup
  Future<void> importDatabase(BuildContext context, String backupPath) async {
    try {
      await BackupService.importDatabase(backupPath);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Database restored successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Delete a backup file
  Future<void> deleteBackup(BuildContext context, BackupModel backup) async {
    try {
      final file = File(backup.filePath); // Use filePath to delete the file
      await file.delete();
      await fetchBackups(); // Refresh the backups list
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Backup deleted successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
