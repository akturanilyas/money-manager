part of 'firestore_bloc.dart';

abstract class FirestoreState extends Equatable {
  const FirestoreState();

  @override
  List<Object> get props => [];
}

class FirestoreInitial extends FirestoreState {}

class Loading extends FirestoreState {
  @override
  String toString() => 'Loading...';
}

class SuccessfullySaved extends FirestoreState {
  @override
  String toString() => 'Successfully saved';
}

class Error extends FirestoreState {
  @override
  String toString() => 'Process failed';
}

class SuccessfullyEdited extends FirestoreState {
  @override
  String toString() => 'Successfully edited';
}

class SuccessfullyDeleted extends FirestoreState {
  @override
  String toString() => 'Successfully deleted';
}
