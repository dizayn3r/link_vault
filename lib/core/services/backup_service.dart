import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class BackupService {
  // Export the database to a file
  static Future<void> exportDatabase() async {
    final databasePath = await getDatabasesPath();
    final sourcePath =
        join(databasePath, 'link_vault.db'); // Replace with your database name

    final directory = await getExternalStorageDirectory();
    final backupPath = join(directory!.path,
        'link_vault_backup_${DateTime.now().toIso8601String()}.db');

    await File(sourcePath).copy(backupPath);
  }

  // Import the database from a file
  static Future<void> importDatabase(String backupPath) async {
    final databasePath = await getDatabasesPath();
    final destinationPath =
        join(databasePath, 'link_vault.db'); // Replace with your database name

    await File(backupPath).copy(destinationPath);
  }

  // List all backup files
  static Future<List<FileSystemEntity>> listBackups() async {
    final directory = await getExternalStorageDirectory();
    print(directory?.path);
    final backupFiles = Directory(directory!.path).listSync();
    return backupFiles.where((file) => file.path.endsWith('.db')).toList();
  }

  Future<void> exportToCsv(List<List<dynamic>> data) async {
    final directory = await getExternalStorageDirectory();
    final csvFile = File(join(
        directory!.path, 'link_vault_${DateTime.now().toIso8601String()}.csv'));

    final csv = const ListToCsvConverter().convert(data);
    await csvFile.writeAsString(csv);
  }
}
