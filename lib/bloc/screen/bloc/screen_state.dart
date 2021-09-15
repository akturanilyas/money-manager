part of 'screen_bloc.dart';

class ScreenState extends Equatable {
  final counter;
  final int index;
  final Widget screen;
  ScreenState(
      {required this.counter, required this.index, required this.screen});

  @override
  List<Object> get props => [counter, index, screen];
}
