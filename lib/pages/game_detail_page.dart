import 'package:flutter/material.dart';
import 'package:games_app/models.dart/game.dart';

class GameDetailPage extends StatelessWidget {
  final Game game;

  const GameDetailPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  game.thumbnail,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(game.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),

            Text(
              game.shortDescription,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildInfoChip('Genre', game.genre),
                _buildInfoChip('Platform', game.platform),
                _buildInfoChip('Publisher', game.publisher),
                _buildInfoChip('Developer', game.developer),
                _buildInfoChip('Release Date', game.releaseDate),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Chip(
      label: Text('$label: $value'),
      backgroundColor: Colors.grey[200],
    );
  }
}
