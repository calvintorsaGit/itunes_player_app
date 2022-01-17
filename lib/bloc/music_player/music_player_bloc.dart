import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:itunes_player_app/model/song.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  late VideoPlayerController? controller;

  MusicPlayerBloc() : super(MusicPlayerInitial()) {
    on<PlayMusicEvent>((event, emit){
      emit(MusicPlayerPlaying(event.songPlayed));
      controller = VideoPlayerController.network(event.songPlayed.trackUrl);
      controller?.initialize();
      controller?.play();
    });

    on<StopMusicEvent>((event, emit) {
      emit(MusicStopPlaying());
      controller?.pause();
    });

    on<ContinueMusicEvent>((event, emit) {
      emit(MusicContinuePlaying());
      controller?.play();
    });
  }


}
