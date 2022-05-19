part of 'main_bloc.dart';

abstract class MainResponseEvent extends Equatable {
  const MainResponseEvent();
  @override
  List<Object?> get props => [];
}


class InitMainResponseEvent extends MainResponseEvent {


  InitMainResponseEvent();
}
