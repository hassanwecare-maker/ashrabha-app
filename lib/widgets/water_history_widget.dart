import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/water_provider.dart';
import 'package:intl/intl.dart';

class WaterHistoryWidget extends StatelessWidget {
  const WaterHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WaterProvider>(
      builder: (context, provider, _) {
        final entries = provider.todayEntries;
        
        if (entries.isEmpty) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  const Icon(Icons.water_drop, size: 48, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('لا توجد إدخالات اليوم'),
                  const SizedBox(height: 8),
                  Text(
                    'ابدأ بإضافة ماء الآن!',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'سجل اليوم',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: const Icon(Icons.water_drop, color: Colors.blue),
                    title: Text('${entry.milliliters.toStringAsFixed(0)} ml - ${entry.drinkType}'),
                    subtitle: Text(
                      DateFormat('hh:mm a', 'ar').format(entry.dateTime),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => provider.removeEntry(index),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}