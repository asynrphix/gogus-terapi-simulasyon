import 'package:flutter/material.dart';
import 'features/breathing_test/screens/cihaz_baglantisi_ekrani.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Göğüs Terapi',
      debugShowCheckedModeBanner: false,
      home: const CihazBaglantisiEkrani(),
    );
  }
}