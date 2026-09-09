import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const AplicativoConstantes());
}

/// Aplicativo que apresenta constantes fundamentais da matemática e da física.
class AplicativoConstantes extends StatelessWidget {
  const AplicativoConstantes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Constantes do Mundo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E5AAC)),
      ),
      home: const HomeScreen(),
    );
  }
}
