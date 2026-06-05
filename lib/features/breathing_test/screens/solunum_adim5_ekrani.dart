import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'test_tamamlandi_ekrani.dart';
import 'hata_adim5_ekrani.dart';

class SolunumAdim5Ekrani extends StatefulWidget {
  const SolunumAdim5Ekrani({super.key});

  @override
  State<SolunumAdim5Ekrani> createState() => _SolunumAdim5EkraniState();
}

class _SolunumAdim5EkraniState extends State<SolunumAdim5Ekrani> {
  int _saniye = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timerBaslat();
  }

  void _timerBaslat() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_saniye > 0) {
        setState(() {
          _saniye--;
        });
      } else {
        _timer?.cancel();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TestTamamlandiEkrani(),
          ),
        );
      }
    });
  }

  String _formatSure(int saniye) {
    int dakika = saniye ~/ 60;
    int kalanSaniye = saniye % 60;
    return '${dakika.toString().padLeft(2, '0')} : ${kalanSaniye.toString().padLeft(2, '0')}';
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
        title: const Text('Adım 5 / 5',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: 5 / 5,
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
                    'Şimdi ağızdan derin nefes alın ve 5 saniye boyunca nefesinizi tutun',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '5 Saniye boyunca nefes alıp vermeyin',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              _formatSure(_saniye),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2196F3),
              ),
            ),
            const SizedBox(height: 32),
Lottie.asset(
              'assets/animations/lungs.json',
              width: 180,
              height: 180,
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
                      builder: (context) => const HataAdim5Ekrani(),
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