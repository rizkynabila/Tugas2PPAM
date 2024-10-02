import 'package:flutter/material.dart';
import 'splash.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 2 Praktikum Pemrograman Aplikasi Mobile',
      routes: {'/': ((context) => const SplashScreen())},
    ),
  );
}