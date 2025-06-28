import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required int id,
    required String title,
    required String thumbnail,
    @JsonKey(name: 'short_description') required String shortDescription,
    @JsonKey(name: 'game_url') required String gameUrl,
    required String genre,
    required String platform,
    required String publisher,
    required String developer,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'freetogame_profile_url')
    required String freetogameProfileUrl,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
