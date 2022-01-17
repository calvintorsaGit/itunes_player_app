part of 'itunes_bloc.dart';

@immutable
abstract class ItunesState {
  const ItunesState();

  @override
  List<Object?> get props => [];
}

class ItunesInitial extends ItunesState {}

class ItunesLoaded extends ItunesState {
  final List<Song> listSong;
  const ItunesLoaded(this.listSong);
}

class ItunesError extends ItunesState {}

