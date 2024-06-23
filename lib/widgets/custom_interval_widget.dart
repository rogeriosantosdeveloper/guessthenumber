import 'package:adivinhar/controllers/game_controller.dart';
import 'package:flutter/material.dart';

class CustomIntervalWidget extends StatelessWidget {
  final GameController gameController;

  const CustomIntervalWidget({required this.gameController, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Personalize o intervalo',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mínimo',
              ),
              onChanged: (value) {
                gameController.min = int.tryParse(value) ?? gameController.min;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Máximo',
              ),
              onChanged: (value) {
                gameController.max = int.tryParse(value) ?? gameController.max;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                gameController.personalizarIntervalo(gameController.min, gameController.max);
                (context as Element).markNeedsBuild();
              },
              child: const Text('Aplicar Intervalo Personalizado'),
            ),
          ],
        ),
      ),
    );
  }
}
