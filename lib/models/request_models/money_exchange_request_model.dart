import 'dart:convert';

class MoneyExchangeRequest {
  final String name;
  final double value;
  final bool status;
  final DateTime created;
  final String imageUrl;

  MoneyExchangeRequest(
      this.name, this.value, this.status, this.created, this.imageUrl);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'status': status,
      'created': created.millisecondsSinceEpoch,
      'imageUrl': imageUrl,
    };
  }

  factory MoneyExchangeRequest.fromMap(Map<String, dynamic> map) {
    return MoneyExchangeRequest(
      map['name'],
      map['value'],
      map['status'],
      DateTime.fromMillisecondsSinceEpoch(map['created']),
      map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MoneyExchangeRequest.fromJson(String source) =>
      MoneyExchangeRequest.fromMap(json.decode(source));
}
