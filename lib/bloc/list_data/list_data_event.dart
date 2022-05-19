part of 'list_data_bloc.dart';

abstract class ListDataEvent extends Equatable {
  const ListDataEvent();
  @override
  List<Object?> get props => [];
}


class InitListDataEvent extends ListDataEvent {


  InitListDataEvent();
}
