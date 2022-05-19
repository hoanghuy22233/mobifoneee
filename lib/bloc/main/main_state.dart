part of 'main_bloc.dart';

abstract class MainResponseState extends Equatable {
  const MainResponseState();
  @override
  List<Object?> get props => [];
}
class InitMainResponseState extends MainResponseState {}

class UpdateMainResponseState extends MainResponseState{
  final MainData data;
  const UpdateMainResponseState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingMainResponseState extends MainResponseState {
}


class ErrorMainResponseState extends MainResponseState{
  final String msg;

  ErrorMainResponseState(this.msg);
  @override
  List<Object> get props => [msg];
}