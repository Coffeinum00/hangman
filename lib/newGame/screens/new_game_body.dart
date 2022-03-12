import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangman/newGame/data/provider/new_game_provider.dart';
import 'package:hangman/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class NewGameBody extends StatelessWidget {
  const NewGameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _alfabet = Provider.of<NewGameProvider>(context).alfabet;
    List listOfWords =
        Provider.of<NewGameProvider>(context).randomWords!.randomWords!;
    int? _currentWord = Provider.of<NewGameProvider>(context).currentWord;
    List _textList = listOfWords[_currentWord!].toLowerCase().split('');
    int _mistakes = Provider.of<NewGameProvider>(context).mistakes!;

    List _passedWords = Provider.of<NewGameProvider>(context).passedWords!;

    return
        //  listOfWords.first == '' ||
        Provider.of<NewGameProvider>(context).loading!
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1 / 3,
                    child: Stack(
                      children: [
                        SvgPicture.asset('assets/svg/hangman.svg'),
                        if (_mistakes > 0)
                          SvgPicture.asset('assets/svg/head.svg'),
                        if (_mistakes > 1) SvgPicture.asset('assets/svg/c.svg'),
                        if (_mistakes > 2)
                          SvgPicture.asset('assets/svg/lA.svg'),
                        if (_mistakes > 3)
                          SvgPicture.asset('assets/svg/lL.svg'),
                        if (_mistakes > 4)
                          SvgPicture.asset('assets/svg/rA.svg'),
                        if (_mistakes > 5)
                          SvgPicture.asset('assets/svg/rL.svg'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
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
                                    MyText(
                                        text: _passedWords
                                                .contains(e.toLowerCase())
                                            ? e
                                            : e,
                                        size: 20),
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
                                        onPressed: _passedWords
                                                .contains(e.toLowerCase())
                                            ? null
                                            : () {
                                                _checkButton(
                                                    letter: e.toLowerCase(),
                                                    textList: _textList,
                                                    context: context);
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

  _checkButton({String? letter, List? textList, context}) {
    if (textList!.contains(letter)) {
      Provider.of<NewGameProvider>(context, listen: false)
          .addPasseLetter(letter!);

      bool _myLocalBool = false;
      List<bool> _wordCheck = [];

      textList.forEach((element) {
        if (Provider.of<NewGameProvider>(context, listen: false)
            .passedWords!
            .contains(element!)) {
          _wordCheck.add(true);
        } else {
          _wordCheck.add(false);
        }
      });

      if (_wordCheck.contains(false)) {
        _myLocalBool = false;
      } else {
        _myLocalBool = true;
      }

      if (Provider.of<NewGameProvider>(context, listen: false).currentWord! <
          Provider.of<NewGameProvider>(context, listen: false)
                  .randomWords!
                  .randomWords!
                  .length -
              1) {
        if (_myLocalBool) {
          Provider.of<NewGameProvider>(context, listen: false).endTimer();
          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            borderSide: BorderSide(color: Colors.blue, width: 2),
            buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
            headerAnimationLoop: false,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Congratulations!',
            desc: 'Press ok to start next level',
            showCloseIcon: false,
            dismissOnBackKeyPress: false,
            btnCancelOnPress: () {
              Provider.of<NewGameProvider>(context, listen: false).loading =
                  true;
              Provider.of<NewGameProvider>(context, listen: false).init();
            },
            btnOkOnPress: () {
              Provider.of<NewGameProvider>(context, listen: false).currentWord =
                  Provider.of<NewGameProvider>(context, listen: false)
                          .currentWord! +
                      1;
              Provider.of<NewGameProvider>(context, listen: false).passedWords =
                  [];
              Provider.of<NewGameProvider>(context, listen: false).startTimer();
            },
          ).show();
        }
      } else {
        // show end game dialog close i restart
        Provider.of<NewGameProvider>(context, listen: false).endTimer();
      }
    } else {
      Provider.of<NewGameProvider>(context, listen: false).mistakes =
          Provider.of<NewGameProvider>(context, listen: false).mistakes! + 1;

      if (Provider.of<NewGameProvider>(context, listen: false).mistakes! >= 6) {
        Provider.of<NewGameProvider>(context, listen: false).endTimer();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          borderSide: BorderSide(color: Colors.red, width: 2),
          buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
          headerAnimationLoop: false,
          animType: AnimType.BOTTOMSLIDE,
          title: '''FAIL
          You're hanging...''',
          desc: 'Press ok to start a new game',
          showCloseIcon: false,
          dismissOnBackKeyPress: false,
          btnCancelOnPress: () {
            Navigator.pop(context);
          },
          btnOkOnPress: () {
            Provider.of<NewGameProvider>(context, listen: false).loading = true;
            Provider.of<NewGameProvider>(context, listen: false).init();
          },
        ).show();
      }
    }
  }
}
