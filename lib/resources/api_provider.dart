import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:itunes_player_app/model/song.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<List<Song>?> fetchItunesSongList(String search) async {
    try {
      String _url = "https://itunes.apple.com/search?term=$search&media=music&entity=song&attribute=artistTerm";
      Response response = await _dio.get(_url);
      Map responseBody = json.decode(response.data);
      List results = responseBody['results'];
      return results.map((e) => Song(e)).toList();
    } catch (error) {
      return null;
    }
  }
}