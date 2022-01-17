part of 'itunes_bloc.dart';

abstract class ItunesEvent extends Equatable {
  const ItunesEvent();

  @override
  List<Object> get props => [];
}

class GetSongListEvent extends ItunesEvent {
  final String search;
  const GetSongListEvent({required this.search}) : super();
}