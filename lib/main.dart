import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'Frankly, my dear, I don\'t give a damn.',
      'answers': [
        {'text': 'The Maltese Falcon', 'score': 0},
        {'text': 'Gone With the Wind', 'score': 1},
        {'text': 'Casablanca', 'score': 0},
      ],
    },
    {
      'questionText': 'All right, Mr. DeMille, I\'m ready for my close-up.',
      'answers': [
        {'text': 'In the Heat of the Night', 'score': 0},
        {'text': 'The Wizard of Oz', 'score': 0},
        {'text': 'Sunset Boulevard', 'score': 1},
      ],
    },
    {
      'questionText': 'What we\'ve got here is failure to communicate.',
      'answers': [
        {'text': 'Cool Hand Luke', 'score': 1},
        {'text': 'Citizen Kane', 'score': 0},
        {'text': 'The Graduate', 'score': 0},
      ],
    },
    {
      'questionText':
          'I\'m as mad as hell, and I\'m not going to take this anymore!',
      'answers': [
        {'text': 'Psycho', 'score': 0},
        {'text': 'Jaws', 'score': 0},
        {'text': 'Network', 'score': 1},
      ],
    },
    {
      'questionText': 'I love the smell of napalm in the morning.',
      'answers': [
        {'text': 'Midnight Cowboy', 'score': 0},
        {'text': 'Apocalypse Now', 'score': 1},
        {'text': 'A Streetcar Named Desire', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Classic Movie Quotes'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
