part of 'screen_bloc.dart';

abstract class ScreenEvent extends Equatable {
  const ScreenEvent(this.index);
  final int index;

  @override
  List<Object> get props => [];
}

class ChangeScreenEvent extends ScreenEvent {
  ChangeScreenEvent(int index) : super(index);
}

class Empty extends ScreenEvent {
  Empty(int index) : super(index);
}
