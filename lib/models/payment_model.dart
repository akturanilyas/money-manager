import 'dart:convert';

class Payment {
  final String name;
  final String payment;
  final DateTime time;
  final String photoUrl;

  Payment({
    required this.name,
    required this.payment,
    required this.time,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'payment': payment,
      'time': time.millisecondsSinceEpoch,
      'photoUrl': photoUrl,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      name: map['name'],
      payment: map['payment'],
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source));
}
