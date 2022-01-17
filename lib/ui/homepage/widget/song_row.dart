import 'package:flutter/material.dart';
import 'package:itunes_player_app/bloc/music_player/music_player_bloc.dart';
import 'package:itunes_player_app/model/song.dart';
import 'package:provider/provider.dart';

class SongRowWidget extends StatelessWidget {
  final Song song;
  Song? songPlayed;
  SongRowWidget(this.song, this.songPlayed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){playMusic(song, context);},
      title: Text(song.trackName),
      subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(song.artistName),
            Text(song.collectionName,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),)
          ]
      ),
      leading: Container(
        width: 60,
        height: 60,
        child: song.artworkUrl != null ? Image.network(song.artworkUrl) : null,
      ),
      trailing: songPlayed==song ? Icon(Icons.music_note):null,
      isThreeLine: true,
    );
  }

  playMusic(Song song, BuildContext context) async {
    context.read<MusicPlayerBloc>().add(PlayMusicEvent(song));
  }
}