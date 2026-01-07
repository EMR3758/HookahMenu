import 'package:flutter/material.dart';
import 'package:hookah_menu/components/category_tile.dart';
import 'package:hookah_menu/components/mix_card.dart';
import 'package:hookah_menu/models/category_data.dart';
import 'package:hookah_menu/models/mix_data.dart';
import 'package:hookah_menu/models/mix_model.dart';
import 'package:hookah_menu/pages/all_mixes_page.dart';
import 'package:hookah_menu/pages/fav_mixes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    // Öne çıkanlar: intensity 6 üstü
    List<MixModel> hotMixes = mixes
        .where(
          (mixes) => mixes.intensity > 6 || mixes.mixTobaccoType == "Blonde",
        )
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Öne Çıkanlar • Kategoriler',
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey[700]),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        "Mix adı, flavor veya marka ara...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.filter_list,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 24,
          right: 16,
          top: 10,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kategoriler
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                'Kategoriler',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      if (category['name'] == "All Mixes") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllMixesPage(),
                          ),
                        );
                      } else {
                        setState(() {
                          selectedCategory = category['name']!.toUpperCase();
                        });
                      }
                    },
                    child: CategoryTile(
                      category: category['name']!,
                      image: category['image']!,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),

            // Öne Çıkanlar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Öne Çıkanlar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavMixesPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Tümünü Gör',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            SizedBox(
              height: 193,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotMixes.length,
                itemBuilder: (context, index) {
                  final mix = hotMixes[index];
                  return MixCard(mix: mix);
                },
              ),
            ),
            const SizedBox(height: 20),

            // Küçük bilgilendirici alanlar - alt alta
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Nasıl Karışım Seçilir?
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Nasıl Karışım Seçilir?"),
                        content: Text(
                          "1. Yoğunluğa karar verin.\n"
                          "2. Meyveli, tatlı veya klasik aromaları tercih edin.\n"
                          "3. Farklı markaları deneyerek kendi favorinizi bulun.",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Kapat"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.info, color: Colors.orange),
                        const SizedBox(height: 6),
                        Text(
                          "Nasıl Karışım Seçilir?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                // Yeni Gelenler
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Yeni Gelenler"),
                        content: Text(
                          "Son eklenen karışımlar:\n"
                          "- Tropikal Passion Mix\n"
                          "- Peach Mango Delight\n"
                          "- Pink Citrus Twist\n\n"
                          "Her hafta yeni tatlar ekleniyor!",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Kapat"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.new_releases, color: Colors.green),
                        const SizedBox(height: 6),
                        Text(
                          "Yeni Gelenler",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
