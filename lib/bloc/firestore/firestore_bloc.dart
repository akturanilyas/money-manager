import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bloctest/repositories/money_repository.dart';

part 'firestore_event.dart';
part 'firestore_state.dart';

class FirestoreBloc extends Bloc<FirestoreEvent, FirestoreState> {
  // FirestoreBloc() : super(FirestoreInitial());

  String name;
  double value;
  bool status;
  DateTime created;
  String imageUrl;
  FirestoreBloc(
    this.name,
    this.value,
    this.status,
    this.created,
    this.imageUrl,
  ) : super(FirestoreInitial());

  @override
  Stream<FirestoreState> mapEventToState(
    FirestoreEvent event,
  ) async* {
    MoneyRepository moneyRepository = MoneyRepository();
    if (event is CreatedButtonTapped) {
      if (await moneyRepository.createExchange(
          name, value, status, created, imageUrl)) {
        yield SuccessfullySaved();
      } else {
        yield Error();
      }
    } else if (event is EditButtonTapped) {
      yield Loading();
      if (await editFunction()) {
        yield SuccessfullyEdited();
      } else {
        yield Error();
      }
    } else if (event is DeleteButtonTapped) {
      yield Loading();
      if (await deleteFunction()) {
        yield SuccessfullyDeleted();
      } else {
        yield Error();
      }
    }
  }

  deleteFunction() async {}
  editFunction() async {}
  createFunction() async {}
}
