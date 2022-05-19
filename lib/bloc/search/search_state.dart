part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object?> get props => [];
}
class InitSearchState extends SearchState {

}

class UpdateSearchState extends SearchState{
  final DataSearch data;
  const UpdateSearchState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingSearchState extends SearchState {
}


class ErrorSearchState extends SearchState{
  final String msg;

  ErrorSearchState(this.msg);
  @override
  List<Object> get props => [msg];
}