import 'package:flutter/material.dart';
import 'main.dart';
class LeaderboardPage extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: leaderboardEntries.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(leaderboardEntries[index].name),
            trailing: Text('${leaderboardEntries[index].score} points'),
          );
        },
      ),
    );
  }
}
  /*
  final List<LeaderboardEntry> entries = [
    LeaderboardEntry('Player1', 100),
    LeaderboardEntry('Player2', 80),
    LeaderboardEntry('Player3', 60),
    LeaderboardEntry('Player4', 90)
    // Daha fazla oyuncu ekleyin
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(entries[index].name),
            trailing: Text('${entries[index].score} points'),
          );
        },
      ),
    );
  }
}*/
class LeaderboardEntry {
  final String name;
  final int score;

  LeaderboardEntry(this.name, this.score);
}
