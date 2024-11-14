import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  final List<Map<String, dynamic>> scores = [
    {'name': 'Oyuncu 1', 'score': 100},
    {'name': 'Oyuncu 2', 'score': 85},
    {'name': 'Oyuncu 3', 'score': 70},
    {'name': 'Oyuncu 4', 'score': 55},
    {'name': 'Oyuncu 5', 'score': 40},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skor Tablosu'),
      ),
      body: ListView.builder(
        itemCount: scores.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(scores[index]['name']),
            trailing: Text('${scores[index]['score']} puan'),
          );
        },
      ),
    );
  }
}
