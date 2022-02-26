import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hangman/newGame/data/model/random_words.dart';
import 'package:http/http.dart' as http;

class NewGameProvider extends ChangeNotifier {
  RandomWords? _randomWords;

  RandomWords? get randomWords => _randomWords;

  int? _currentWord;

  int? _mistakes = 0;

  int? get mistakes => _mistakes;
  set mistakes(int? newMistake) {
    _mistakes = newMistake;
    notifyListeners();
  }

  List<String>? _passedWords;
  List<String>? get passedWords => _passedWords;

  set passedWords(List<String>? newList) {
    _passedWords = newList;
    notifyListeners();
  }

  addPasseLetter(String letter) {
    _passedWords!.add(letter);
    notifyListeners();
  }

  bool? _loading;

  bool? get loading => _loading;
  set loading(bool? newLoad) {
    _loading = newLoad;
    notifyListeners();
  }

  bool? _moveLevel;

  bool? get moveLevel => _moveLevel;
  set moveLevel(bool? newMoveLevel) {
    _moveLevel = newMoveLevel;
    notifyListeners();
  }

  // set passedWords(List<String>? newList) {
  //   _passedWords = newList;
  //   notifyListeners();
  // }

  init() {
    _randomWords = RandomWords(randomWords: ['']);
    _currentWord = 0;
    _mistakes = 0;
    _passedWords = [];
    _loading = true;
    _moveLevel = false;
    _fetchData();
  }
// Future = jedno zapytanie do serwera i daje jedną odpowiedź
// alternatywą jest Stream (aka RealTime), który nasłuchuje na zmiany na serwerze, gdy są zmiany to daje zmiany w aplikacji

  Future _fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://random-word-api.herokuapp.com/word?number=10&swear=0'));

      _randomWords = RandomWords.fromJson(response.body);
      _loading = false;

      notifyListeners();
    } catch (error) {
      print('error');
    }
  }

  NewGameProvider() {
    // _init();
  }

  final List _alfabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  List get alfabet => _alfabet;

  int? get currentWord => _currentWord;
  set currentWord(int? newIndex) {
    _currentWord = newIndex;
    notifyListeners();
  }
}
