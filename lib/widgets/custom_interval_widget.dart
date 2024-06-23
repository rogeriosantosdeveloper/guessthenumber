import 'package:adivinhar/controllers/game_controller.dart';
import 'package:flutter/material.dart';

class CustomIntervalWidget extends StatefulWidget {
  final GameController gameController;

  const CustomIntervalWidget({required this.gameController, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomIntervalWidgetState createState() {
    return _CustomIntervalWidgetState();
  }
}

class _CustomIntervalWidgetState extends State<CustomIntervalWidget> {
  late TextEditingController _minController;
  late TextEditingController _maxController;

  @override
  void initState() {
    super.initState();
    _minController =
        TextEditingController(text: widget.gameController.min.toString());
    _maxController =
        TextEditingController(text: widget.gameController.max.toString());
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  void _applyInterval() {
    final int? min = int.tryParse(_minController.text);
    final int? max = int.tryParse(_maxController.text);
    if (min != null && max != null) {
      widget.gameController.personalizarIntervalo(min, max);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Desafio Personalizado',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _minController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número Mínimo',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _maxController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número Máximo',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _applyInterval,
              child: const Text('Iniciar Desafio Personalizado'),
            ),
          ],
        ),
      ),
    );
  }
}
