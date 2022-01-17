part of 'music_player_bloc.dart';

@immutable
abstract class MusicPlayerState extends Equatable{
  const MusicPlayerState();

  @override
  List<Object> get props => [];
}

class MusicPlayerInitial extends MusicPlayerState {
  @override
  List<Object> get props => [];
}

class MusicPlayerPlaying extends MusicPlayerState {
  final Song song;
  const MusicPlayerPlaying(this.song);

  @override
  List<Object> get props => [song];
}

class MusicStopPlaying extends MusicPlayerState {}

class MusicContinuePlaying extends MusicPlayerState {}

