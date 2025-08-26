import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu),
      tooltip: 'Settings',
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'settings',
          child: Row(
            children: [
              Icon(Icons.settings),
              SizedBox(width: 12),
              Text('Settings'),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'theme',
          child: Row(
            children: [
              Icon(Icons.palette),
              SizedBox(width: 12),
              Text('Theme'),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'language',
          child: Row(
            children: [
              Icon(Icons.language),
              SizedBox(width: 12),
              Text('Language'),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'notifications',
          child: Row(
            children: [
              Icon(Icons.notifications),
              SizedBox(width: 12),
              Text('Notifications'),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'about',
          child: Row(
            children: [
              Icon(Icons.info),
              SizedBox(width: 12),
              Text('About'),
            ],
          ),
        ),
      ],
      onSelected: (String value) {
        // Handle menu item selection
        switch (value) {
          case 'settings':
            // TODO: Navigate to settings screen
            break;
          case 'theme':
            // TODO: Toggle theme
            break;
          case 'language':
            // TODO: Change language
            break;
          case 'notifications':
            // TODO: Configure notifications
            break;
          case 'about':
            // TODO: Show about dialog
            break;
        }
      },
    );
  }
}
