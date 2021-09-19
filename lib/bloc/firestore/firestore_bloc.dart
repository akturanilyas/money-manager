import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloctest/models/money_exchange_model.dart';
import 'package:bloctest/repositories/money_repository.dart';
import 'package:equatable/equatable.dart';

part 'firestore_event.dart';
part 'firestore_state.dart';

class FirestoreBloc extends Bloc<FirestoreEvent, FirestoreState> {
  FirestoreBloc() : super(FirestoreInitial());
  List<MoneyExchange> exchanges = <MoneyExchange>[];
  @override
  Stream<FirestoreState> mapEventToState(
    FirestoreEvent event,
  ) async* {
    MoneyRepository moneyRepository = MoneyRepository();
    if (event is GetExchanges) {
      //todo ! implement there errorhandling
      yield Loading();
      exchanges = await moneyRepository.getExchanges();
      yield ExchangesGetted(await moneyRepository.getExchanges());
      // if (await moneyRepository.getExchanges()) {
      //   yield ExchangesGetted(await moneyRepository.getExchanges());
      // } else {
      //   yield Error();
      // }
    } else if (event is CreatedButtonTapped) {
      if (await moneyRepository.createExchange(event.name, event.value,
          event.status, event.created, event.imageUrl)) {
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
