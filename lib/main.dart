import 'package:flutter/material.dart';

import './question.dart'; //import a package from the same directory with ./
import './answer.dart';

void main() {
  runApp(MyApp()); //functie necesara pentru a rula aplicatia
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    //questions.lenght always is 3, bc we have 3 questions
    // var questions = const[] ar fi permis reinitilizarea
    {
      'questionText': 'What\'s your favorite color?', //maps
      'answers': ['Blue', 'White', 'Green'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Cat', 'Dog', 'Chicken', 'Elephant'],
    },
    {
      'questionText': 'Wha\'s your favorite fruit',
      'answers': ['Apple', 'Orange', 'Strawberry', 'Cashhew'],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    //var aBool = true; boolean, true or false only
    //aBool = false;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      // '>', '<=', '>=', '==', '!='
      print('We have more questions!');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    //questions = []; doesn't work if questions is a const
    //daca sus e const questions, nu se poate schimba valoarea
    //var dummy = ['hello']; //daca adaug const nu se mai poate modifica
    //dummy.add('world');
    //print(dummy); //dummy.add pentru a adauga o valoare variabilei dummy
    //daca se va mofica, folosesti final sau var,daca nu, const;

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true, //centreaza textul in AppBar
          backgroundColor: Colors.cyan.shade400, //culoarea AppBar
          title: Text('My first app'), //ce se afiseaza in AppBar
        ),
        body: _questionIndex < questions.length
            ? Column(
                //'?', daca e true, do this,
                children: [
                  Question(questions[_questionIndex]['questionText']),
                  //daca ar fi fost 1, ar fi afisat a doua
                  //intrebare, iar daca ar fi fost 2, a treia intrebare. Se mai
                  //putea scrie question.elementAt(0)
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it!'),
              ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
