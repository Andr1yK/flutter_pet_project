import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/BigCard.dart';
import '../components/ui/LikeButton.dart';
import '../store/AppState.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pair = appState.current;
    var onToggle = appState.toggleFavorite;
    var favorites = appState.favorites;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LikeButton(
                onToggle: onToggle,
                isLiked: favorites.contains(pair),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: appState.getNext,
                child: Text('Next'),
              ),
            ],
          )
        ],
      ),
    );
  }
}