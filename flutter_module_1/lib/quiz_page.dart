import 'package:flutter/material.dart';
import 'main.dart';

class QuizPage extends StatefulWidget {
   final String username;

  QuizPage({required this.username});
  @override
  
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [
    Question('1)Fransanın başkenti neresidir?', ['Paris', 'London', 'Berlin', 'Madrid'], 0),
    Question('2)"To Kill a Mockingbird" yazarı kimdir?', ['Harper Lee', 'Mark Twain', 'Ernest Hemingway', 'F. Scott Fitzgerald'], 0),
    Question('3)Düşünen Adam heykelini kim yaptı? ', ['Salvador','Picasso','Rodin','Neiman'], 2),
    Question('4)Gece Nöbetini hangi sanatçı çizmiştir?',['Rubens', 'Van Eyck','Gainsborough', 'Rembrandt'],3),
    Question('5)Ahtapotun kaç kalbi var?',['3','4','5','7'] ,0),
    Question('6)İnsan yapımı gazlı içecekleri kim icat etti?', ['emile berlin','Rutherford Appleton','Joseph Priestley','Mark Twain'],2),
    Question('7)2001 yılında BBC nin "Yılın Spor Şahsiyeti" kimdi? ', ['David Beckham','Dallas Cowboys','Victoria Azarenka','Joseph Priestley',],0),
    Question('8)Sutopu takımında kaç oyuncu var?', ['3','5','6','7'], 3),
    Question('9)2020 itibariyle, Snookers Dünya Şampiyonasını kazanan son Galli adam kimdi? ', ['Garbiñe Muguruza','Mark Williams','Rutherford Appleton','Joseph Priestley'],1),
    Question('10)İlk bilgisayar animasyonları nerede üretildi? ', ['Rutherford Appleton Laboratuvarı','İngiltere','Fransa','Almanya'],0),
  ];
  
  int currentQuestionIndex = 0;
  int score = 0;

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      score += 10;
    } else {
      score -= 5;
    }

    setState(() {
      currentQuestionIndex++;
    });

    if (currentQuestionIndex >= questions.length) {
      leaderboardEntries.add(LeaderboardEntry(widget.username, score));
      leaderboardEntries.sort((a, b) => b.score.compareTo(a.score));
      _showGameOverDialog();

    }
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Game Over'),
        content: Text('Your score is $score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: currentQuestionIndex < questions.length
          ? QuizQuestion(
              question: questions[currentQuestionIndex],
              answerQuestion: _answerQuestion,
            )
          : Center(
              child: Text('No more questions!'),
            ),
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final Question question;
  final Function(int) answerQuestion;

  QuizQuestion({required this.question, required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question.text,
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ...question.answers.asMap().entries.map((entry) {
          int index = entry.key;
          String answer = entry.value;
          return ElevatedButton(
            onPressed: () => answerQuestion(index),
            child: Text(answer),
          );
        }).toList(),
      ],
    );
  }
}

class Question {
  final String text;
  final List<String> answers;
  final int correctAnswerIndex;

  Question(this.text, this.answers, this.correctAnswerIndex);
}
