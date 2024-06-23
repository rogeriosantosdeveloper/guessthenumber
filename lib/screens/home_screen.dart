import 'package:adivinhar/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/guessing_widget.dart';
import '../widgets/difficulty_widget.dart';
import '../widgets/custom_interval_widget.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  late GameController _gameController;

  @override
  void initState() {
    super.initState();
    _gameController = GameController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo de Adivinhação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GuessingWidget(gameController: _gameController),
            const SizedBox(height: 20),
            DifficultyWidget(gameController: _gameController),
            const SizedBox(height: 20),
            CustomIntervalWidget(gameController: _gameController),
          ],
        ),
      ),
    );
  }
}
