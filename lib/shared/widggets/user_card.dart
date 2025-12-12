import 'package:flutter/material.dart';
import 'profile_avatar.dart';
import 'points_badge.dart';

class UserCard extends StatelessWidget {
  final String username;
  final String? avatar;
  final bool online;
  final VoidCallback onCommentPressed;

  const UserCard({
    super.key,
    required this.username,
    required this.online,
    required this.onCommentPressed,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ProfileAvatar(size: 32, imageUrl: avatar),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username, style: theme.textTheme.titleMedium),
                  StatusBadge(online: online),
                ],
              ),
            ),
            IconButton(
              onPressed: onCommentPressed,
              icon: const Icon(Icons.edit),
            )
          ],
        ),
      ),
    );
  }
}
