import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/mix_model.dart';

class MixDetailPage extends StatelessWidget {
  final MixModel mix;
  const MixDetailPage({super.key, required this.mix});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "mix details",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 10),

              Text(
                mix.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 6),
                    Text("Geri"),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              _mixInfoCard(),
              const SizedBox(height: 30),

              /// 🔥 CHART + BİLEŞENLER TEK KART
              _chartWithIngredients(),
            ],
          ),
        ),
      ),
    );
  }

  /// ---------------- MIX INFO ----------------
  Widget _mixInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mix.description),
          const SizedBox(height: 12),
          Row(
            children: [
              _chip(mix.mixType),
              const SizedBox(width: 8),
              _chip(mix.mixTobaccoType),
            ],
          ),
        ],
      ),
    );
  }

  /// ---------------- CHART + LIST ----------------
  Widget _chartWithIngredients() {
    final total = mix.ingredients.values.fold<double>(0, (a, b) => a + b);
    final entries = mix.ingredients.entries.toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Bileşenler",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          /// PIE CHART
          SizedBox(
            height: 200,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 45,
                sectionsSpace: 4,
                sections: List.generate(entries.length, (index) {
                  final entry = entries[index];
                  final percent = (entry.value / total) * 100;

                  return PieChartSectionData(
                    value: entry.value,
                    title: "%${percent.toStringAsFixed(0)}",
                    radius: 65,
                    titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    color: _chartColors[index % _chartColors.length],
                  );
                }),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// INGREDIENT LIST (chart içinde)
          ...List.generate(entries.length, (index) {
            final entry = entries[index];
            final percent = (entry.value / total) * 100;
            return _ingredientRow(
              entry.key,
              percent,
              _chartColors[index % _chartColors.length],
            );
          }),
        ],
      ),
    );
  }

  /// ---------------- INGREDIENT ROW ----------------
  Widget _ingredientRow(String name, double value, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 8, backgroundColor: color),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "%${value.toStringAsFixed(0)}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  /// ---------------- CHIP ----------------
  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}

/// ---------------- COLORS ----------------
final List<Color> _chartColors = [
  Color(0xFFB38B45),
  Color(0xFFC9A24D),
  Color(0xFFD6B56D),
  Color(0xFFE5C88A),
  Color(0xFFF2DBA7),
];
