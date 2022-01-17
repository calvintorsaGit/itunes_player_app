import 'package:flutter_test/flutter_test.dart';
import 'package:itunes_player_app/bloc/music_player/music_player_bloc.dart';
import 'package:itunes_player_app/model/song.dart';
import 'package:bloc_test/bloc_test.dart';

main() async {

  late MusicPlayerBloc musicPlayerBloc;

  setUp(() {
    musicPlayerBloc = MusicPlayerBloc();
  });

  var song = Song({'previewUrl': 'a', 'artworkUrl60':'a','trackName': 'a', 'artistName':'a','collectionName':'a'});

  blocTest(
    'emits [Song] when PlayMusicEvent is added',
    build: () => musicPlayerBloc,
    act: (bloc) => musicPlayerBloc.add(PlayMusicEvent(song)),
    wait: const Duration(milliseconds: 300),
    expect: () => [song],
  );

}