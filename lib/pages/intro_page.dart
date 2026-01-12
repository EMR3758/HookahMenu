import 'package:flutter/material.dart';
import 'package:hookah_menu/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('lib/images/home.png', height: 240),
              ),

              const SizedBox(height: 48),

              // title
              const Text(
                'Hookah & Chill',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),

              const SizedBox(height: 16),

              // subtitle
              const Text(
                'Dumanı takip et, keyfin tadını çıkar.',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // start button
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Keşfet',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
