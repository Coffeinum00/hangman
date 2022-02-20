import 'package:flutter/material.dart';
import 'package:hangman/newGame/data/provider/new_game_provider.dart';
import 'package:provider/provider.dart';

import 'home/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewGameProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hangman',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Home(),
      ),
    );
  }
}
