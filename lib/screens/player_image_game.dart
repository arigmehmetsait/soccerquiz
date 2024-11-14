import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlayerImageGame extends StatefulWidget {
  @override
  _PlayerImageGameState createState() => _PlayerImageGameState();
}

class _PlayerImageGameState extends State<PlayerImageGame> {
  List<Map<String, dynamic>> players = [];
  late Map<String, dynamic> currentPlayer;
  List<String> options = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPlayers();
  }

  Future<void> fetchPlayers() async {
    final response = await http.get(Uri.parse(
        'https://www.thesportsdb.com/api/v1/json/3/searchplayers.php?t=Arsenal'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        players =
            List<Map<String, dynamic>>.from(data['player'].map((player) => {
                  'name': player['strPlayer'] as String,
                  'image': player['strThumb'] as String? ??
                      'https://via.placeholder.com/200x200.png?text=No+Image'
                }));
        isLoading = false;
      });
      startNewGame();
    } else {
      throw Exception('Failed to load players');
    }
  }

  void startNewGame() {
    setState(() {
      currentPlayer = players[Random().nextInt(players.length)];
      options = [currentPlayer['name'] as String];
      var otherPlayers = players
          .where((p) => p['name'] != currentPlayer['name'])
          .map((p) => p['name'] as String)
          .toList()
        ..shuffle();
      options.addAll(otherPlayers.take(3));
      options.shuffle();
    });
  }

  void checkAnswer(String selectedName) {
    if (selectedName == currentPlayer['name']) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Doğru!'),
            content: Text('Tebrikler, doğru tahmin ettiniz!'),
            actions: <Widget>[
              TextButton(
                child: Text('Sonraki'),
                onPressed: () {
                  Navigator.of(context).pop();
                  startNewGame();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Yanlış!'),
            content: Text(
                'Maalesef, yanlış tahmin. Doğru cevap: ${currentPlayer['name']}'),
            actions: <Widget>[
              TextButton(
                child: Text('Tekrar Dene'),
                onPressed: () {
                  Navigator.of(context).pop();
                  startNewGame();
                },
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
        title: Text('Futbolcu Resmini Tahmin Et'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  currentPlayer['image'] as String,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  },
                ),
                SizedBox(height: 20),
                ...options.map(
                  (name) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      child: Text(name),
                      onPressed: () => checkAnswer(name),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
