import 'dart:convert';

class MoneyExchangeRequest {
  final String name;
  final double value;
  final bool status;
  final DateTime created;
  final int image;

  MoneyExchangeRequest(
      this.name, this.value, this.status, this.created, this.image);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'status': status,
      'created': created.millisecondsSinceEpoch,
      'image': image,
    };
  }

  factory MoneyExchangeRequest.fromMap(Map<String, dynamic> map) {
    return MoneyExchangeRequest(
      map['name'],
      map['value'],
      map['status'],
      DateTime.fromMillisecondsSinceEpoch(map['created']),
      map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MoneyExchangeRequest.fromJson(String source) =>
      MoneyExchangeRequest.fromMap(json.decode(source));
}
