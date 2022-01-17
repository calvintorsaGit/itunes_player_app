import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:itunes_player_app/model/song.dart';
import 'package:itunes_player_app/resources/api_repository.dart';
import 'package:meta/meta.dart';

part 'itunes_event.dart';
part 'itunes_state.dart';

class ItunesBloc extends Bloc<ItunesEvent, ItunesState> {
  final ApiRepository _apiRepository = ApiRepository();

  ItunesBloc() : super(ItunesInitial()) {
    on<GetSongListEvent>((event, emit) async{
      try {
        final mList = await _apiRepository.fetchSongList(event.search);
        if(mList != null) emit(ItunesLoaded(mList));
        if (mList == null) {
          emit(ItunesError());
        }
      } on NetworkError {
        print('network error');
        emit(ItunesError());
      }
    });


  }
}
