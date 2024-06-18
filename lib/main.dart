import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const JogoAdivinhacao());
}

class JogoAdivinhacao extends StatelessWidget {
  const JogoAdivinhacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo de Adivinhação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final _random = Random();
  int? _numeroSecreto;
  int? _tentativa;
  String _mensagem = '';
  int _min = 1;
  int _max = 100;
  int _dificuldade = 1; // 1 = Fácil, 2 = Médio, 3 = Difícil
  Color _mensagemColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _gerarNumeroSecreto();
  }

  void _gerarNumeroSecreto() {
    setState(() {
      _numeroSecreto = _random.nextInt(_max - _min + 1) + _min;
    });
  }

  void _adivinharNumero() {
    setState(() {
      if (_tentativa == _numeroSecreto) {
        _mensagem = 'Parabéns! Você acertou!';
        _mensagemColor = Colors.green;
      } else if (_tentativa! < _numeroSecreto!) {
        _mensagem = 'Tente um número maior!';
        _mensagemColor = Colors.red;
      } else {
        _mensagem = 'Tente um número menor!';
        _mensagemColor = Colors.red;
      }
    });
  }

  void _alterarDificuldade(int nivel) {
    setState(() {
      _dificuldade = nivel;
      switch (nivel) {
        case 1:
          _min = 1;
          _max = 100;
          break;
        case 2:
          _min = 1;
          _max = 500;
          break;
        case 3:
          _min = 1;
          _max = 1000;
          break;
      }
      _gerarNumeroSecreto();
    });
  }

  void _personalizarIntervalo(int min, int max) {
    setState(() {
      _min = min;
      _max = max;
      _gerarNumeroSecreto();
    });
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
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Adivinhe o número entre $_min e $_max',
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
                        _tentativa = int.tryParse(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _adivinharNumero,
                      child: const Text('Adivinhar'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _mensagem,
                      style: TextStyle(
                        fontSize: 18,
                        color: _mensagemColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
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
                      value: _dificuldade,
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('Fácil')),
                        DropdownMenuItem(value: 2, child: Text('Médio')),
                        DropdownMenuItem(value: 3, child: Text('Difícil')),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          _alterarDificuldade(value);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
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
                        _min = int.tryParse(value) ?? _min;
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
                        _max = int.tryParse(value) ?? _max;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _personalizarIntervalo(_min, _max);
                      },
                      child: const Text('Aplicar Intervalo Personalizado'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}