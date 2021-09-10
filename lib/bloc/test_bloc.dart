import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestState(name: ''));

  @override
  Stream<TestState> mapEventToState(
    TestEvent event,
  ) async* {
    if (event is AddPaymentEvent) {
      yield TestState(name: 'ilyas');
    } else if (event is EditPaymentEvent) {
      yield TestState(name: '');
    } else if (event is DeletePaymentEvent) {
      yield TestState(name: '');
    }
  }
}
