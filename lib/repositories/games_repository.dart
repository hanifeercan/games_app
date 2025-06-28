import 'package:dio/dio.dart';
import 'package:games_app/models.dart/game.dart';

Future<List<Game>> fetchGames() async {
  try {
    final Response response = await Dio().get(
      'https://www.freetogame.com/api/games',
    );
    final List gameList = response.data;
    final games = gameList.map((e) => Game.fromJson(e)).toList();
    return games;
  } catch (e) {
    rethrow;
  }
}
