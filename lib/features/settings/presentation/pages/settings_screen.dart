import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'backup_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Consumer<ThemeProvider>(
            builder: (context, provider, child) {
              return ListTile(
                leading: Icon(Icons.dark_mode_rounded),
                title: Text("Dark Mode"),
                trailing: Switch(
                  value: provider.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    provider
                        .setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Backup & Restore'),
            leading: const Icon(Icons.backup),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BackupScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
