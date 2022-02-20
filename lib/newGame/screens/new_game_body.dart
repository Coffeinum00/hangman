import 'package:flutter/material.dart';

class NewGameBody extends StatelessWidget {
  const NewGameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ),
        Expanded(
          child: Container(
            color: Colors.blue[300],
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
