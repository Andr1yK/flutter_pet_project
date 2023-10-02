import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/AppState.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var favorites = appState.favorites;
    var onRemove = appState.removeFavorite;

    if (favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${favorites.length} favorites:'),
        ),
        for (var pair in favorites)
          ListTile(
            title: Text(pair.asLowerCase),
            leading: Icon(Icons.favorite),
            onTap: () {
              onRemove(pair);
            },
          )
      ],
    );
  }
}