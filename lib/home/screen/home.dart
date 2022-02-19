import 'package:flutter/material.dart';

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
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'New game',
                style: TextStyle(fontFamily: 'Courgette'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: ElevatedButton(
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
