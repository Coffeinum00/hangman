import 'package:flutter/material.dart';
import 'package:hangman/newGame/screens/new_game_body.dart';
import 'package:hangman/widgets/text_widget.dart';

class NewGame extends StatelessWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_left_outlined, size: 50),
        ),
        title: const MyText(
          text: 'Timer',
          size: 25,
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 15.0, top: 15.0),
              child: MyText(
                size: 25,
                text: '1',
              )),
        ],
      ),
      body: const NewGameBody(),
    );
  }
}
