import 'dart:convert';

import 'package:flutter/material.dart';

class MoneyExchange {
  final String id;
  final String name;
  final double value;
  final bool status;
  final DateTime created;
  final int image;

  MoneyExchange(
      this.id, this.name, this.value, this.status, this.created, this.image);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'status': status,
      'created': created.millisecondsSinceEpoch,
      'image': image,
    };
  }

  factory MoneyExchange.fromMap(Map<String, dynamic> map) {
    return MoneyExchange(
      map['id'],
      map['name'],
      map['value'],
      map['status'],
      DateTime.fromMillisecondsSinceEpoch(map['created']),
      map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MoneyExchange.fromJson(String source) =>
      MoneyExchange.fromMap(json.decode(source));
}
