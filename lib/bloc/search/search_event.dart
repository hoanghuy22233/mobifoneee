part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => [];
}


class InitSearchEvent extends SearchEvent {
  final String search;

  InitSearchEvent(this.search);
}
