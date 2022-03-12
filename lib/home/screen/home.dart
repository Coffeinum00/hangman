import 'package:flutter/material.dart';
import 'package:hangman/newGame/data/provider/new_game_provider.dart';

import 'package:hangman/auth/sign_up.dart';
import 'package:hangman/screens/leaderboard.dart';
import 'package:hangman/screens/new_game_screen.dart';
import 'package:provider/provider.dart';

import '../../auth/auth_state.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<NewGameProvider>(context);
    Provider.of<AuthState>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthState>(context, listen: false).signOut();
            },
          ),
        ],
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
                if (Provider.of<NewGameProvider>(context, listen: false)
                        .timer !=
                    null) {
                  Provider.of<NewGameProvider>(context, listen: false)
                      .endTimer();
                }
                Provider.of<NewGameProvider>(context, listen: false).init();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewGame(),
                  ),
                );
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Leaderboard(),
                    ),
                  );
                },
                child: const Text(
                  'Leaderboard',
                  style: TextStyle(fontFamily: 'Courgette'),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.orange),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ),
                );
              },
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
