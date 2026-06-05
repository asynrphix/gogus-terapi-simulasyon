import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'dart:math';
import 'test_tamamlandi_ekrani.dart';
import 'solunum_adim3_ekrani.dart';
import 'hata_adim2_ekrani.dart';

class SolunumAdim2Ekrani extends StatefulWidget {
  const SolunumAdim2Ekrani({super.key});

  @override
  State<SolunumAdim2Ekrani> createState() => _SolunumAdim2EkraniState();
}

class _SolunumAdim2EkraniState extends State<SolunumAdim2Ekrani> {
  int _saniye = 10;
  Timer? _timer;
  int _solunumSayisi = 0;

  @override
  void initState() {
    super.initState();
    _solunumSayisiUret();
    _timerBaslat();
  }

  void _solunumSayisiUret() {
    final random = Random();
    _solunumSayisi = random.nextInt(30) + 8; // 8-37 arası random
  }

  void _timerBaslat() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_saniye > 0) {
        setState(() {
          _saniye--;
        });
      } else {
        _timer?.cancel();
        _solunumKontrol();
      }
    });
  }

  void _solunumKontrol() {
    if (_solunumSayisi < 12 || _solunumSayisi > 30) {
      _testiBitir();
    } else {
      _adim3eGec();
    }
  }

  /*void _testiBitir() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Test Sonucu'),
        content: Text(
          'Dakika solunum sayısı: $_solunumSayisi\n\nSolunum sayısı normal aralığın dışında. Test sonlandırılıyor.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }*/
  void _testiBitir() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const TestTamamlandiEkrani(),
    ),
  );
}

  void _adim3eGec() {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Test Sonucu'),
      content: Text(
        'Dakika solunum sayısı: $_solunumSayisi\n\nSolunum sayısı normal aralıkta. Teste devam ediliyor.',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SolunumAdim3Ekrani(),
              ),
            );
          },
          child: const Text('Devam Et'),
        ),
      ],
    ),
  );
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
        title: const Text('Adım 2 / 5',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: 2 / 5,
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
                    'Şimdi normal şekilde nefes alın.\nNefesinizi değiştirmeyin.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '3 dakika boyunca doğal şekilde nefes alıp vermeye devam edin',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 120,
              child: ListWheelScrollView(
                itemExtent: 40,
                physics: const FixedExtentScrollPhysics(),
                children: [
                  Text('02 : 00',
                      style: TextStyle(
                          fontSize: 24, color: Colors.grey[400])),
                  Text(
                    _formatSure(_saniye),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  Text('04 : 00',
                      style: TextStyle(
                          fontSize: 24, color: Colors.grey[400])),
                ],
              ),
            ),
            const SizedBox(height: 24),
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
                      builder: (context) => const HataAdim2Ekrani(),
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