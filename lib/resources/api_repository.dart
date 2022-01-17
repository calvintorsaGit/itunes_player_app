import 'package:itunes_player_app/model/song.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<Song>?> fetchSongList(String search) {
    return _provider.fetchItunesSongList(search);
  }
}

class NetworkError extends Error {}
