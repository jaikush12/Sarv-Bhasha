import 'package:flutter/material.dart';



class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;
  int _score = 0;

  List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': [
        {'text': 'Berlin', 'correct': false},
        {'text': 'Paris', 'correct': true},
        {'text': 'Madrid', 'correct': false},
        {'text': 'Rome', 'correct': false},
      ],
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'answers': [
        {'text': 'Mars', 'correct': true},
        {'text': 'Venus', 'correct': false},
        {'text': 'Jupiter', 'correct': false},
        {'text': 'Saturn', 'correct': false},
      ],
    },
    // Add more questions as needed
  ];

  void _answerQuestion(bool isCorrect) {
    setState(() {
      _questionIndex++;
      _score += isCorrect ? 1 : 0;
    });

    if (_questionIndex < _questions.length) {
      // More questions available
    } else {
      // Quiz finished
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quiz Finished'),
            content: Text('Your Score: $_score out of ${_questions.length}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  setState(() {
                    // Reset the quiz
                    _questionIndex = 0;
                    _score = 0;
                  });
                },
                child: Text('Restart Quiz'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _questionIndex < _questions.length
          ? QuizQuestion(
              question: _questions[_questionIndex]['question'] as String,
              answers: _questions[_questionIndex]['answers'] as List<Map<String, Object>>,
              onAnswerSelected: _answerQuestion,
            )
          : Center(
              child: Text('Quiz Finished!'),
            ),
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final String question;
  final List<Map<String, Object>> answers;
  final Function(bool) onAnswerSelected;

  QuizQuestion({
    required this.question,
    required this.answers,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            question,
            style: TextStyle(fontSize: 20),
          ),
        ),
        ...answers.map((answer) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () => onAnswerSelected(answer['correct'] as bool),
              child: Text(answer['text'] as String),
            ),
          );
        }).toList(),
      ],
    );
  }
}


 var uri = Uri.parse(
        'https://image-translation-api.onrender.com/extract_and_translate');