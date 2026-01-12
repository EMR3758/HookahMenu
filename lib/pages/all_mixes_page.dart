import 'package:flutter/material.dart';
import 'package:hookah_menu/components/mix_card.dart';
import 'package:hookah_menu/models/mix_data.dart';
import 'package:hookah_menu/models/mix_model.dart';

class AllMixesPage extends StatelessWidget {
  final String? tobaccoType;

  /// tobaccoType null → tüm mixler
  /// dolu → sadece o türe ait mixler
  const AllMixesPage({super.key, this.tobaccoType});

  @override
  Widget build(BuildContext context) {
    final List<MixModel> mixList = tobaccoType == null
        ? mixes
        : mixes.where((mix) => mix.mixTobaccoType == tobaccoType).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const Text(
                    'Nargile Karışım Menü',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tobaccoType == null ? "Tüm Mixler" : "$tobaccoType Mixler",
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 15),
                  Container(height: 1, color: Colors.grey[300]),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  tobaccoType == null ? "Tüm Mixler" : "$tobaccoType Mixler",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "${mixList.length} sonuç",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// Mix List
            Expanded(
              child: ListView.builder(
                itemCount: mixList.length,
                itemBuilder: (context, index) {
                  final mix = mixList[index];

                  /// Each Mix Card = MixModel
                  /// Return MixCard widget
                  return MixCard(mix: mix);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
