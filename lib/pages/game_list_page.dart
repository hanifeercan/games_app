import 'package:flutter/material.dart';
import 'package:games_app/models.dart/game.dart';
import 'package:games_app/repositories/games_repository.dart';

class GameListPage extends StatefulWidget {
  const GameListPage({super.key});

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  List<Game> games = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchGames();
  }

  Future<void> _fetchGames() async {
    games = await fetchGames();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Game List')),
      body: Center(
        child: isLoading ? const CircularProgressIndicator() : buildGames(),
      ),
    );
  }

  Widget buildGames() {
    if (games.isEmpty) {
      return const Text('No games available');
    }
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: games.length,
      itemBuilder: (context, index) {
        final game = games[index];
        return GestureDetector(
          child: Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: buildImage(game.thumbnail, 200, 200)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    game.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildImage(String url, double width, double height) {
  return Center(
    child: Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Image.network(url, fit: BoxFit.cover),
    ),
  );
}
