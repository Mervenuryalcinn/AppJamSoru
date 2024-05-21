import 'package:flutter/material.dart';
import 'package:flutter_module_1/leaderboard_page.dart';
import 'login.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/leaderboard': (context) => LeaderboardPage(),
      },
    );
  }
}
class LeaderboardEntry {
  final String name;
  final int score;

  LeaderboardEntry(this.name, this.score);
}

List<LeaderboardEntry> leaderboardEntries = [];
