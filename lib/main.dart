import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answers': [
        {'Text': 'Black', 'score': 10},
        {'Text': 'Red', 'score': 5},
        {'Text': 'Green', 'score': 3},
        {'Text': 'Orange', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'Text': 'Dog', 'score': 10},
        {'Text': 'Cat', 'score': 5},
        {'Text': 'Rabbit', 'score': 3},
        {'Text': 'Parrot', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your favourite book?',
      'answers': [
        {'Text': 'Alchemist', 'score': 10},
        {'Text': 'Lord of the Rings', 'score': 5},
        {'Text': 'Godfather', 'score': 3},
        {'Text': 'Algorithms and data structures', 'score': 1},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple quiz app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
