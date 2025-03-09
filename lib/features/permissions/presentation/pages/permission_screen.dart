import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../dashboard/presentation/pages/dashboard_screen.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  bool _isLoading = false;
  PermissionStatus _storagePermissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    _getStoragePermissionStatus();
  }

  Future<void> _getStoragePermissionStatus() async {
    final status = await Permission.photos.status;
    setState(() {
      _storagePermissionStatus = status;
    });
    _checkAndNavigate();
  }

  void _checkAndNavigate() {
    if (_storagePermissionStatus.isGranted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
  }

  Future<void> _requestPermissions() async {
    setState(() => _isLoading = true);

    final status =
        await Permission.photos.request(); //or Permission.storage.request()
    setState(() {
      _storagePermissionStatus = status;
    });

    if (_storagePermissionStatus.isGranted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
      );
    } else {
      _handlePermissionDenied();
    }

    setState(() => _isLoading = false);
  }

  void _handlePermissionDenied() {
    if (_storagePermissionStatus.isPermanentlyDenied) {
      _showPermissionDeniedDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Permissions are required to use the app.'),
        ),
      );
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permissions Required'),
        content: const Text(
          'LinkVault needs storage permissions to save and restore backups. '
          'Please enable permissions in the app settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => openAppSettings(),
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LinkVault needs the following permissions to function properly:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              '- Storage: To save and restore backups',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 40),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _requestPermissions,
                    child: const Text('Grant Permissions'),
                  ),
          ],
        ),
      ),
    );
  }
}
