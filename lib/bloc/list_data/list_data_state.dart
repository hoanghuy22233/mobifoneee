part of 'list_data_bloc.dart';

abstract class ListDataState extends Equatable {
  const ListDataState();
  @override
  List<Object?> get props => [];
}
class InitListDataState extends ListDataState {}

class UpdateListDataState extends ListDataState{
  final DataList data;
  const UpdateListDataState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingListDataState extends ListDataState {
}


class ErrorListDataState extends ListDataState{
  final String msg;

  ErrorListDataState(this.msg);
  @override
  List<Object> get props => [msg];
}