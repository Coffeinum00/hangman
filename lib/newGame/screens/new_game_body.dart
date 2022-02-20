import 'package:flutter/material.dart';
import 'package:hangman/newGame/data/provider/new_game_provider.dart';
import 'package:hangman/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class NewGameBody extends StatelessWidget {
  const NewGameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _alfabet = Provider.of<NewGameProvider>(context).alfabet;
    String _example = 'Example';
    List _textList = _example.split('');

    return Column(
      children: [
        Container(
          color: Colors.indigo[300],
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1 / 3,
        ),
        Container(
          color: Colors.green[300],
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1 / 6,
          child: Center(
            child: Wrap(
              spacing: 10,
              children: _textList
                  .map((e) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText(text: e, size: 20),
                          Container(
                            width: 30,
                            height: 5,
                            color: Colors.black,
                          )
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            // color: Colors.blue[300],
            width: double.infinity,
            child: Center(
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: _alfabet
                    .map((e) => Container(
                          width: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                print(e);
                              },
                              child: Text(e)),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
