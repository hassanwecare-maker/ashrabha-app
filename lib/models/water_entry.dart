class WaterEntry {
  final DateTime dateTime;
  final double milliliters;
  final String drinkType; // ماء، عصير، شاي، قهوة، إلخ

  WaterEntry({
    required this.dateTime,
    required this.milliliters,
    this.drinkType = 'ماء',
  });

  Map<String, dynamic> toJson() => {
    'dateTime': dateTime.toIso8601String(),
    'milliliters': milliliters,
    'drinkType': drinkType,
  };

  factory WaterEntry.fromJson(Map<String, dynamic> json) => WaterEntry(
    dateTime: DateTime.parse(json['dateTime'] as String),
    milliliters: (json['milliliters'] as num).toDouble(),
    drinkType: json['drinkType'] as String? ?? 'ماء',
  );
}