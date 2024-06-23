import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class AdivinheiGame extends StatelessWidget {
  const AdivinheiGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adivinhei, your better game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TelaInicial(),
    );
  }
}
