import 'package:bloctest/models/money_exchange_model.dart';
import 'package:bloctest/services/money_services.dart';

class MoneyRepository {
  MoneyService _moneyService = MoneyService();
  Future<dynamic> getExchanges() async {
    List<MoneyExchange> _exchanges = [];
    try {
      //todo !
      _exchanges = await _moneyService.getExchanges();
      return _exchanges;
    } catch (e) {
      print('Error: ' + e.toString());
      return [];
    }
  }

  Future<bool> createExchange(String name, double value, bool status,
      DateTime created, int image) async {
    try {
      await _moneyService.createExchange(name, value, status, created, image);
      return true;
    } catch (e) {
      print('Error : ' + e.toString());
      return false;
    }
  }
}
