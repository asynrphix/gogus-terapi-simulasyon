import 'package:flutter/material.dart';

class TestTamamlandiEkrani extends StatefulWidget {
  const TestTamamlandiEkrani({super.key});

  @override
  State<TestTamamlandiEkrani> createState() => _TestTamamlandiEkraniState();
}

class _TestTamamlandiEkraniState extends State<TestTamamlandiEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F4FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8F4FD),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Test Tamamlandı',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Color(0xFF4CAF50),
                    size: 64,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Solunum kaydı başarı ile tamamlandı',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lütfen bekleyiniz verileriniz analiz ediliyor.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            const SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
                backgroundColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Lütfen Bekleyin...',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF2196F3),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}