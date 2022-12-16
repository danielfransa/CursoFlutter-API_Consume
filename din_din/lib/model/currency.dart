import 'dart:convert';

class Currency {
  String name;
  double buy;
  double sell;
  double variation;
  Currency({
    required this.name,
    required this.buy,
    required this.sell,
    required this.variation,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'buy': buy,
      'sell': sell,
      'variation': variation,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      name: map['name'] ?? '',
      buy: map['buy']?.toDouble() ?? 0.0,
      sell: map['sell']?.toDouble() ?? 0.0,
      variation: map['variation']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Currency.fromJson(String source) =>
      Currency.fromMap(json.decode(source));
}
