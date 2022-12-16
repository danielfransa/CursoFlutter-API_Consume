import 'dart:convert';

class Stocks {
  String name;
  String location;
  double points;
  double variation;

  Stocks({
    required this.name,
    required this.location,
    required this.points,
    required this.variation,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'points': points,
      'variation': variation,
    };
  }

  factory Stocks.fromMap(Map<String, dynamic> map) {
    return Stocks(
        name: map['name'] ?? '',
        location: map['location'] ?? '',
        points: map['points']?.toDouble() ?? 0.0,
        variation: map['variation']?.toDouble() ?? 0.0);
  }

  String toJson() => json.encode(toMap());

  factory Stocks.fromJson(String source) => Stocks.fromMap(jsonDecode(source));
}
