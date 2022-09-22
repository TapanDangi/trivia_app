import 'package:flutter/material.dart';
import './questions.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  //named arguments are passed here
  //@required shows that all these parameters are mandatory to be defined
  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        //spread operator(...) is used to convert Nested List into individual values for the parent list
        //map method executes the function passed as an argument to it on every element in the List on which map is called
        //takes the List of String and converts it into List of Widgets through map method
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        })
        //() => answerQuestion() is only triggered when button is pressed, so it is passed as a function, not a pointer
        //and answer['score'] can be passed in it as argument
      ],
    );
  }
}
