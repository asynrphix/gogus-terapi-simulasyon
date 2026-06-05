import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'solunum_adim4_ekrani.dart';
import 'hata_adim3_ekrani.dart';

class SolunumAdim3Ekrani extends StatefulWidget {
  const SolunumAdim3Ekrani({super.key});

  @override
  State<SolunumAdim3Ekrani> createState() => _SolunumAdim3EkraniState();
}

class _SolunumAdim3EkraniState extends State<SolunumAdim3Ekrani> {
  int _tamamlananOksuruk = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _simulasyonBaslat();
  }

  void _simulasyonBaslat() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_tamamlananOksuruk < 3) {
        setState(() {
          _tamamlananOksuruk++;
        });
        if (_tamamlananOksuruk == 3) {
          _timer?.cancel();
         Future.delayed(const Duration(seconds: 1), () {
           Navigator.push(
             context,
              MaterialPageRoute(
                builder: (context) => const SolunumAdim4Ekrani(),
              ),
            );
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
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
            _timer?.cancel();
            Navigator.pop(context);
          },
        ),
        title: const Text('Adım 3 / 5',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: 3 / 5,
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
                    'Şimdi ard arda 3 kez öksürün',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Her öksürük otomatik olarak algılanacaktır.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.check_circle,
                    color: index < _tamamlananOksuruk
                        ? const Color(0xFF4CAF50)
                        : Colors.grey[300],
                    size: 48,
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  _timer?.cancel();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HataAdim3Ekrani(),
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
          ],
        ),
      ),
    );
  }
}