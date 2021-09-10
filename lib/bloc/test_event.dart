part of 'test_bloc.dart';

class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}

class AddPaymentEvent extends TestEvent {}

class EditPaymentEvent extends TestEvent {}

class DeletePaymentEvent extends TestEvent {}
