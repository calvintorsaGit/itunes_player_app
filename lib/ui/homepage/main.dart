import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_player_app/bloc/itunes/itunes_bloc.dart';
import 'package:itunes_player_app/bloc/music_player/music_player_bloc.dart';
import 'package:itunes_player_app/model/song.dart';
import 'package:itunes_player_app/ui/homepage/widget/player_bar.dart';
import 'package:itunes_player_app/ui/homepage/widget/search_box.dart';
import 'package:itunes_player_app/ui/homepage/widget/song_list.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItunesBloc _itunesBloc = ItunesBloc();
  final MusicPlayerBloc _musicPlayerBloc = MusicPlayerBloc();

  Song? musicPlayed;
  bool isMusicPlayed = false;
  VideoPlayerController? controller;

  @override
  void initState() {
    // initial search 'adele'
    _itunesBloc.add(GetSongListEvent(search: 'adele'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocProvider.value(
          value: _itunesBloc,
          child: ArtistSearchBox(),
        ),
      ),
      body: Container(
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: _itunesBloc,
            ),
            BlocProvider.value(
              value: _musicPlayerBloc,
            ),
          ],
          child: BlocListener<MusicPlayerBloc, MusicPlayerState>(
            listener: (context, state) {
              if (state is MusicPlayerPlaying) {
                setState(() {
                  musicPlayed = state.song;
                });
              }
            },
            child: BlocBuilder<ItunesBloc, ItunesState>(
              builder: (context, itunesState) {
                return BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
                  builder: (context, musicState) {
                    return Column(
                      children: [
                        if (itunesState is ItunesLoaded)
                          SongListWidget(itunesState.listSong, musicPlayed),
                        if (musicState is MusicPlayerPlaying ||
                            musicState is MusicContinuePlaying)
                          const PlayerBar(true)
                        else if (musicState is MusicStopPlaying)
                          const PlayerBar(false)
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
