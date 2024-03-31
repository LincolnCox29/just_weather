import 'package:flutter/material.dart';
import 'package:just_weather/load_screen/imports.dart';
import 'package:just_weather/home_screen/imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
        
      ),
      routes: {
        '/load' : (context) => Load() as Widget,
        '/home' : (context) => HomePage()
      },
      home: Load() as Widget,
    );
  }
}
