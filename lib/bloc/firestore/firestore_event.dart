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
  final DateTime created;
  final int image;

  CreatedButtonTapped({
    required this.name,
    required this.value,
    required this.status,
    required this.created,
    required this.image,
  });
  @override
  String toString() => 'Name: $name, value: $value, status: $status';
}

class GetExchanges extends FirestoreEvent {
  String toString() => 'Exchanges geted';
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
