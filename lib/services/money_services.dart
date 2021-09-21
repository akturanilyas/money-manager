import 'dart:convert';

import 'package:bloctest/models/money_exchange_model.dart';
import 'package:bloctest/models/request_models/money_exchange_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MoneyService {
  Future<List<MoneyExchange>> getExchanges() async {
    List<MoneyExchange> exchanges = [];
    var encodedExchange;
    final String userId = '1'; // TODO! [Implement] UserID
    final firestoreInstance = FirebaseFirestore.instance;
    await firestoreInstance
        .collection('users')
        .doc(userId)
        .collection('exchanges')
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach(
          (result) {
            encodedExchange = json.encode(result.data());
            if (encodedExchange != null && encodedExchange.length > 0) {
              encodedExchange =
                  encodedExchange.substring(0, encodedExchange.length - 1);
            }
            encodedExchange = encodedExchange + ',"id":"${result.id}"}';
            print(encodedExchange);
            exchanges.add(MoneyExchange.fromJson(encodedExchange));
          },
        );
      },
    );

    return exchanges;
  }

  Future<void> createExchange(String name, double value, bool status,
      DateTime created, int image) async {
    final firestoreInstance = FirebaseFirestore.instance;
    MoneyExchangeRequest test =
        MoneyExchangeRequest(name, value, status, created, image);
    //TODO! id must be implement
    final String userId = '1';
    await firestoreInstance
        .collection("users")
        .doc(userId)
        .collection("exchanges")
        .add(test.toMap());
  }
}
