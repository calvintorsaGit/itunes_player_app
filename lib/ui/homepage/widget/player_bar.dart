import 'package:flutter/material.dart';
import 'package:itunes_player_app/bloc/music_player/music_player_bloc.dart';
import 'package:itunes_player_app/model/song.dart';
import 'package:provider/provider.dart';

class PlayerBar extends StatelessWidget {
  final bool isMusicPlayed;
  const PlayerBar(this.isMusicPlayed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.orange,
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(
                isMusicPlayed ? Icons.pause : Icons.play_arrow
              ),
              onPressed: () {
                  isMusicPlayed ? context.read<MusicPlayerBloc>().add(StopMusicEvent()) :
                  context.read<MusicPlayerBloc>().add(ContinueMusicEvent());
              }),
        ],
      ),
    );
  }
}
