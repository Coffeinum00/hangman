import 'package:flutter/material.dart';
import 'package:hangman/newGame/data/provider/new_game_provider.dart';
import 'package:hangman/newGame/screens/new_game_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hangman The Game',
          style: TextStyle(
            fontFamily: 'Courgette',
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/hangman.png'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue[500]),
              onPressed: () {
                Provider.of<NewGameProvider>(context, listen: false).init();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewGame()));
              },
              child: const Text(
                'New game',
                style: TextStyle(fontFamily: 'Courgette'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: Colors.lightGreen[500]),
                onPressed: () {},
                child: const Text(
                  'Leaderboard',
                  style: TextStyle(fontFamily: 'Courgette'),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.orange),
              onPressed: () {},
              child: const Text(
                'Log out',
                style: TextStyle(fontFamily: 'Courgette'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
