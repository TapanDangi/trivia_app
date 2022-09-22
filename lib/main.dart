import 'package:flutter/material.dart';
import 'package:trivia_app/result.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  //for restarting the quiz
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Green', 'score': 6},
        {'text': 'Yellow', 'score': 9},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 2},
      ],
    },
    {
      'questionText': 'What\'s your favourite pet?',
      'answers': [
        {'text': 'Cat', 'score': 6},
        {'text': 'Dog', 'score': 3},
        {'text': 'Rabbit', 'score': 8},
        {'text': 'Snake', 'score': 10},
      ],
    },
    {
      'questionText': 'What\'s your favourite place?',
      'answers': [
        {'text': 'Beach', 'score': 4},
        {'text': 'Mountain', 'score': 1},
        {'text': 'Village', 'score': 7},
        {'text': 'Metropolis', 'score': 9},
      ],
    },
  ];

//For re-rendering the screen every time a button is pressed
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        body: _questionIndex < _questions.length
            //executes if the condition is true
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            //executes if the condition is false
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
