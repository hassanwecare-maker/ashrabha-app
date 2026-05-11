import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/water_entry.dart';

class WaterProvider extends ChangeNotifier {
  List<WaterEntry> _waterEntries = [];
  double _dailyGoal = 2000; // 2 لتر بالملي
  late SharedPreferences _prefs;

  WaterProvider() {
    _init();
  }

  // Getters
  List<WaterEntry> get waterEntries => _waterEntries;
  double get dailyGoal => _dailyGoal;
  
  double get todayTotal {
    final today = DateTime.now();
    return _waterEntries
        .where((entry) =>
            entry.dateTime.year == today.year &&
            entry.dateTime.month == today.month &&
            entry.dateTime.day == today.day)
        .fold(0.0, (sum, entry) => sum + entry.milliliters);
  }

  double get todayPercentage => (todayTotal / _dailyGoal * 100).clamp(0, 100);

  List<WaterEntry> get todayEntries {
    final today = DateTime.now();
    return _waterEntries
        .where((entry) =>
            entry.dateTime.year == today.year &&
            entry.dateTime.month == today.month &&
            entry.dateTime.day == today.day)
        .toList();
  }

  Map<String, double> get weeklyData {
    final now = DateTime.now();
    final data = <String, double>{};
    
    for (int i = 6; i >= 0; i--) {
      final date = now.subtract(Duration(days: i));
      final day = _getDayName(date.weekday);
      final total = _waterEntries
          .where((entry) =>
              entry.dateTime.year == date.year &&
              entry.dateTime.month == date.month &&
              entry.dateTime.day == date.day)
          .fold(0.0, (sum, entry) => sum + entry.milliliters);
      data[day] = total;
    }
    return data;
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    _loadData();
  }

  void addWater(double milliliters, [String drinkType = 'ماء']) {
    _waterEntries.add(
      WaterEntry(
        dateTime: DateTime.now(),
        milliliters: milliliters,
        drinkType: drinkType,
      ),
    );
    _saveData();
    notifyListeners();
  }

  void removeEntry(int index) {
    if (index >= 0 && index < _waterEntries.length) {
      _waterEntries.removeAt(index);
      _saveData();
      notifyListeners();
    }
  }

  void setDailyGoal(double goal) {
    _dailyGoal = goal;
    _prefs.setDouble('dailyGoal', goal);
    notifyListeners();
  }

  Future<void> _saveData() async {
    final jsonData = jsonEncode(
      _waterEntries.map((e) => e.toJson()).toList(),
    );
    await _prefs.setString('waterEntries', jsonData);
  }

  void _loadData() {
    final jsonString = _prefs.getString('waterEntries');
    _dailyGoal = _prefs.getDouble('dailyGoal') ?? 2000;

    if (jsonString != null) {
      final jsonData = jsonDecode(jsonString) as List;
      _waterEntries = jsonData
          .map((e) => WaterEntry.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    notifyListeners();
  }

  String _getDayName(int weekday) {
    const days = ['الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت', 'الأحد'];
    return days[weekday - 1];
  }

  Future<void> clearAllData() async {
    _waterEntries.clear();
    await _prefs.remove('waterEntries');
    notifyListeners();
  }
}