import 'package:flutter/foundation.dart';
import 'package:hangman/newGame/data/model/random_words.dart';
import 'package:http/http.dart' as http;

class NewGameProvider extends ChangeNotifier {
  RandomWords? _randomWords;

  RandomWords? get randomWords => _randomWords;

  _init() {
    _randomWords = RandomWords();
    _fetchData();
  }
// Future = jedno zapytanie do serwera i daje jedną odpowiedź
// alternatywą jest Stream (aka RealTime), który nasłuchuje na zmiany na serwerze, gdy są zmiany to daje zmiany w aplikacji

  Future _fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://random-word-api.herokuapp.com/word?number=10&swear=0'));

      _randomWords = RandomWords.fromJson(response.body);
      print(_randomWords!.randomWords);
    } catch (error) {
      print('error');
    }
  }

  NewGameProvider() {
    _init();
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
}
