import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/water_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WaterTrackerWidget extends StatelessWidget {
  const WaterTrackerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WaterProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            CircularPercentIndicator(
              radius: 100,
              lineWidth: 8,
              percent: provider.todayPercentage / 100,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${provider.todayTotal.toStringAsFixed(0)} ml',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'من ${provider.dailyGoal.toStringAsFixed(0)} ml',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
              progressColor: Colors.blue,
              backgroundColor: Colors.grey[300]!,
            ),
            const SizedBox(height: 30),
            Text(
              '${provider.todayPercentage.toStringAsFixed(0)}% من الهدف اليومي',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _QuickAddButton(
                  label: '250 ml',
                  amount: 250,
                ),
                _QuickAddButton(
                  label: '500 ml',
                  amount: 500,
                ),
                _QuickAddButton(
                  label: '750 ml',
                  amount: 750,
                ),
                _QuickAddButton(
                  label: '1 L',
                  amount: 1000,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showCustomDialog(context),
                icon: const Icon(Icons.add),
                label: const Text('إضافة كمية مخصصة'),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCustomDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إضافة كمية'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'أدخل الكمية بالملي لتر',
            suffixText: 'ml',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              final amount = double.tryParse(controller.text) ?? 0;
              if (amount > 0) {
                context.read<WaterProvider>().addWater(amount);
                Navigator.pop(context);
              }
            },
            child: const Text('إضافة'),
          ),
        ],
      ),
    );
  }
}

class _QuickAddButton extends StatelessWidget {
  final String label;
  final double amount;

  const _QuickAddButton({
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 50,
      child: ElevatedButton(
        onPressed: () => context.read<WaterProvider>().addWater(amount),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: Text(label),
      ),
    );
  }
}