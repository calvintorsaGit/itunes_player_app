import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_player_app/bloc/music_player/music_player_bloc.dart';
import 'package:itunes_player_app/model/song.dart';
import 'package:itunes_player_app/ui/homepage/widget/song_row.dart';

import 'package:provider/provider.dart';


class SongListWidget extends StatelessWidget {
  final List<Song> songList;
  Song? musicPlayed;

  SongListWidget(this.songList, this.musicPlayed) : super();

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      child: songList.isNotEmpty ?
      BlocProvider.value(
        value: context.read<MusicPlayerBloc>(),
        child: ListView(
          children: songList.map((song) => SongRowWidget(song, musicPlayed)).toList(),
        ),
      ) :
      Center(
        child: songList.isEmpty ?
        Text("No aartist", style: TextStyle(color: Colors.red),) :
        Text("Search Artist"),
      ),
    )
    );
  }
}
