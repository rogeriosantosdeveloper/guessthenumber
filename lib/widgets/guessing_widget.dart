import 'package:adivinhar/controllers/game_controller.dart';
import 'package:flutter/material.dart';

class GuessingWidget extends StatelessWidget {
  final GameController gameController;

  const GuessingWidget({required this.gameController, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Adivinhe o número entre ${gameController.min} e ${gameController.max}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sua tentativa',
              ),
              onChanged: (value) {
                gameController.tentativa = int.tryParse(value);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                gameController.adivinharNumero();
                (context as Element).markNeedsBuild();
              },
              child: const Text('Adivinhar'),
            ),
            const SizedBox(height: 20),
            Text(
              gameController.mensagem,
              style: TextStyle(
                fontSize: 18,
                color: gameController.mensagemColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
