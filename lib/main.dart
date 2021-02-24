import 'package:flutter/material.dart';
import 'package:task3/Converter.dart';
import 'package:task3/HalamanUtama.dart';
import 'package:task3/LoginDepan.dart';
import 'package:task3/LuasVolume.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginDepan(),
          '/HalamanUtama': (context) => HalamanUtama(),
          '/LuasVolume': (context) => LuasVolume(),
          '/Converter': (context) => Converter(),
        },
        debugShowCheckedModeBanner: false,
    );
  }
}

