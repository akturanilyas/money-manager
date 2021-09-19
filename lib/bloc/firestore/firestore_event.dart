part of 'firestore_bloc.dart';

abstract class FirestoreEvent extends Equatable {
  const FirestoreEvent();

  @override
  List<Object> get props => [];
}

class CreatedButtonTapped extends FirestoreEvent {
  final String name;
  final double value;
  final bool status;

  CreatedButtonTapped(
      {required this.name, required this.value, required this.status});
  @override
  String toString() => 'Name: $name, value: $value, status: $status';
}

class EditButtonTapped extends FirestoreEvent {
  final String id;
  final String name;
  final double value;
  final bool status;

  @override
  EditButtonTapped(
      {required this.id,
      required this.name,
      required this.value,
      required this.status});
}

class DeleteButtonTapped extends FirestoreEvent {
  final String id;

  DeleteButtonTapped({required this.id});
}
