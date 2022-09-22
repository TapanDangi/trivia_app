import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartQuiz;

  Result(this.resultScore, this.restartQuiz);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are not strange!';
    } else if (resultScore <= 16) {
      resultText = 'You are somewhat strange!';
    } else if (resultScore <= 24) {
      resultText = 'You are very strange!';
    } else {
      resultText = 'You are the strangest!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: TextButton(
              onPressed: restartQuiz,
              child: Text('Restart Quiz!'),
            ),
          ),
        ],
      ),
    );
  }
}
