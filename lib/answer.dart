import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 1.5),
      child: RaisedButton(
        color: Colors.blueGrey,
        textColor: Colors.black, //deja exista clasa Colors, grup de culori
        child: Text(answerText),
        onPressed: selectHandler, //null da buton gri, dezactivat;
      ),
    );
  }
}
