part of 'test_bloc.dart';

class TestState extends Equatable {
  final String name;
  const TestState({required this.name});

  @override
  List<Object> get props => [name];
}
