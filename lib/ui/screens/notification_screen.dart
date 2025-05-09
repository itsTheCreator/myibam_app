import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = const [
    {
      'title': 'Nouvelle annonce',
      'body': 'Une nouvelle annonce a été publiée.'
    },
    {
      'title': 'Mise à jour',
      'body': 'Votre emploi du temps a été mis à jour.'
    },
    {
      'title': 'Rappel',
      'body': 'N’oubliez pas de consulter vos messages.'
    },
  ];

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                'Aucune notification',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => Divider(height: 1),
              itemBuilder: (context, index) {
                final notif = notifications[index];
                return ListTile(
                  leading: Icon(Icons.notifications, color: Theme.of(context).colorScheme.primary),
                  title: Text(notif['title'] ?? ''),
                  subtitle: Text(notif['body'] ?? ''),
                );
              },
            ),
    );
  }
}