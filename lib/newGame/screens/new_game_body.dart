import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangman/newGame/data/provider/new_game_provider.dart';
import 'package:hangman/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class NewGameBody extends StatelessWidget {
  const NewGameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _alfabet = Provider.of<NewGameProvider>(context).alfabet;
    List listOfWords =
        Provider.of<NewGameProvider>(context).randomWords!.randomWords!;
    int? _currentWord = Provider.of<NewGameProvider>(context).currentWord;
    List _textList = listOfWords[_currentWord!].split('');
    int _mistakes = Provider.of<NewGameProvider>(context).mistakes!;

    return listOfWords.first == ''
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1 / 3,
                child: Stack(
                  children: [
                    SvgPicture.asset('assets/svg/hangman.svg'),
                    if (_mistakes > 0) SvgPicture.asset('assets/svg/head.svg'),
                    if (_mistakes > 1) SvgPicture.asset('assets/svg/c.svg'),
                    if (_mistakes > 2) SvgPicture.asset('assets/svg/lA.svg'),
                    if (_mistakes > 3) SvgPicture.asset('assets/svg/lL.svg'),
                    if (_mistakes > 4) SvgPicture.asset('assets/svg/rA.svg'),
                    if (_mistakes > 5) SvgPicture.asset('assets/svg/rL.svg'),
                  ],
                ),
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
                                MyText(text: '', size: 20),
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
                                      Provider.of<NewGameProvider>(context,
                                                  listen: false)
                                              .mistakes =
                                          Provider.of<NewGameProvider>(context,
                                                      listen: false)
                                                  .mistakes! +
                                              1;
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
