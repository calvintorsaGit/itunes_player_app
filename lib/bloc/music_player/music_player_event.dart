part of 'music_player_bloc.dart';

@immutable
abstract class MusicPlayerEvent extends Equatable {
  const MusicPlayerEvent();

  @override
  List<Object> get props => [];
}

class PlayMusicEvent extends MusicPlayerEvent {
  final Song songPlayed;
  const PlayMusicEvent(this.songPlayed);

  @override
  List<Object> get props => [songPlayed];
}

class StopMusicEvent extends MusicPlayerEvent {}

class ContinueMusicEvent extends MusicPlayerEvent {}
