import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function resetHandler;

  Result(this.finalScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (finalScore < 4) {
      resultText = 'You need to watch more classic movies!';
    } else {
      resultText = 'You know your classic movies!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Retry Quiz'),
            textColor: Colors.red,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
