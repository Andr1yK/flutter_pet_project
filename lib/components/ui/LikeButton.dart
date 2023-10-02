import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    super.key,
    required this.onToggle,
    required this.isLiked,
  });

  final void Function() onToggle;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (isLiked) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return ElevatedButton.icon(
      onPressed: onToggle,
      label: Text('Like'),
      icon: Icon(icon),
    );
  }
}