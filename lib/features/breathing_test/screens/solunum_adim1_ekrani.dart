import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'solunum_adim2_ekrani.dart';
import 'hata_adim1_ekrani.dart';

class SolunumAdim1Ekrani extends StatefulWidget {
  const SolunumAdim1Ekrani({super.key});

  @override
  State<SolunumAdim1Ekrani> createState() => _SolunumAdim1EkraniState();
}

class _SolunumAdim1EkraniState extends State<SolunumAdim1Ekrani> {
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _speak();
  }

  Future<void> _speak() async {
    await _tts.setLanguage('tr-TR');
    await _tts.setSpeechRate(0.5);
    await _tts.speak('Lütfen 1 kez öksürün. Öksürük otomatik olarak algılanacaktır.');
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F4FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8F4FD),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            _tts.stop();
            Navigator.pop(context);
          },
        ),
        title: const Text('Adım 1 / 5',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: 1 / 5,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Icon(Icons.info, color: Color(0xFF2196F3), size: 32),
                  SizedBox(height: 12),
                  Text(
                    'Lütfen 1 Kez Öksürün',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Öksürük otomatik olarak algılanacaktır',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Icon(Icons.volume_up, color: Color(0xFF2196F3), size: 28),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Lottie.asset(
              'assets/animations/lungs.json',
              width: 180,
              height: 180,
            ),
            const SizedBox(height: 24),
            const Icon(
              Icons.check_circle,
              color: Color(0xFF4CAF50),
              size: 48,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  _tts.stop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SolunumAdim2Ekrani(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Devam Et',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  _tts.stop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HataAdim1Ekrani(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Hata Simülasyonu',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}