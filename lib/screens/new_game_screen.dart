import 'package:flutter/material.dart';
import 'package:hangman/newGame/data/provider/new_game_provider.dart';
import 'package:hangman/screens/new_game_body.dart';

import 'package:hangman/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class NewGame extends StatelessWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? _currentWord = Provider.of<NewGameProvider>(context).currentWord;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:
              Provider.of<NewGameProvider>(context, listen: true).timer == null
                  ? null
                  : () {
                      if (Provider.of<NewGameProvider>(context, listen: false)
                              .timer !=
                          null) {
                        Provider.of<NewGameProvider>(context, listen: false)
                            .endTimer();
                      }
                      Navigator.pop(context);
                    },
          icon: const Icon(Icons.arrow_left_outlined, size: 50),
        ),
        title: MyText(
          text: Provider.of<NewGameProvider>(context, listen: true)
                  .time
                  .toString() +
              's',
          size: 25,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0, top: 15.0),
            child: MyText(
              size: 25,
              text: (_currentWord! + 1).toString(),
            ),
          ),
        ],
      ),
      body: WillPopScope(
          onWillPop: () async {
            if (Provider.of<NewGameProvider>(context, listen: false).timer !=
                null) {
              Provider.of<NewGameProvider>(context, listen: false).endTimer();
              return true;
            } else {
              return false;
            }
          },
          child: NewGameBody()),
    );
  }
}
