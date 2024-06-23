import 'package:adivinhar/controllers/game_controller.dart';
import 'package:flutter/material.dart';

class DifficultyWidget extends StatelessWidget {
  final GameController gameController;

  const DifficultyWidget({required this.gameController, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Escolha a dificuldade',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            DropdownButton<int>(
              value: gameController.dificuldade,
              items: const [
                DropdownMenuItem(value: 1, child: Text('Fácil')),
                DropdownMenuItem(value: 2, child: Text('Médio')),
                DropdownMenuItem(value: 3, child: Text('Difícil')),
              ],
              onChanged: (value) {
                if (value != null) {
                  gameController.alterarDificuldade(value);
                  (context as Element).markNeedsBuild();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
