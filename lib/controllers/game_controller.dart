import 'dart:math';
import 'package:flutter/material.dart';

class GameController {
  final Random _random = Random();
  int? _numeroSecreto;
  int? _tentativa;
  String _mensagem = '';
  int _min = 1;
  int _max = 100;
  int _dificuldade = 1; // 1 = Fácil, 2 = Médio, 3 = Difícil
  Color _mensagemColor = Colors.black;

  GameController() {
    _gerarNumeroSecreto();
  }

  int get min => _min;
  int get max => _max;
  int get dificuldade => _dificuldade;
  String get mensagem => _mensagem;
  Color get mensagemColor => _mensagemColor;

  set tentativa(int? value) {
    _tentativa = value;
  }

  void _gerarNumeroSecreto() {
    _numeroSecreto = _random.nextInt(_max - _min + 1) + _min;
  }

  void adivinharNumero() {
    if (_tentativa == _numeroSecreto) {
      _mensagem = 'Correto!! Adivinhou o Número!! Parábens!!!';
      _mensagemColor = Colors.green;
    } else if (_tentativa! > _max) {
      _mensagem = 'O seu número é maior que o número máximo!!';
      _mensagemColor = Colors.red;
    } else if (_tentativa! < _min) {
      _mensagem = 'O seu número é menor que o número mínimo!!';
      _mensagemColor = Colors.red;
    } else if (_tentativa! < _numeroSecreto!) {
      _mensagem = 'O número correto é maior que seu número!!';
      _mensagemColor = Colors.red;
    } else if (_tentativa! > _numeroSecreto!) {
      _mensagem = 'O número correto é menor que seu número!!';
      _mensagemColor = Colors.red;
    }
  }

  void alterarDificuldade(int nivel) {
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
  }

  void personalizarIntervalo(int min, int max) {
    _min = min;
    _max = max;
    _gerarNumeroSecreto();
  }
}
