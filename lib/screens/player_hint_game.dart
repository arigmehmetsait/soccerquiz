import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class PlayerHintGame extends StatefulWidget {
  @override
  _PlayerHintGameState createState() => _PlayerHintGameState();
}

class _PlayerHintGameState extends State<PlayerHintGame>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> players = [
    {
      'name': 'Messi',
      'hints': ['Arjantinli', 'Sol ayaklı', '7 kez Ballon d\'Or kazandı']
    },
    {
      'name': 'Ronaldo',
      'hints': ['Portekizli', 'CR7 lakaplı', '5 kez Şampiyonlar Ligi kazandı']
    },
    {
      'name': 'Neymar',
      'hints': ['Brezilyalı', 'PSG\'de oynadı', 'Samba futboluyla ünlü']
    },
    {
      'name': 'Mbappe',
      'hints': ['Fransız', 'Çok hızlı', 'Genç yaşta Dünya Kupası kazandı']
    },
    {
      'name': 'Salah',
      'hints': ['Mısırlı', 'Liverpool\'da oynuyor', 'Hızlı ve çevik']
    },
    {
      'name': 'Hazard',
      'hints': ['Belçikalı', 'Sol kanatta oynadı', 'Real Madrid forması giydi']
    },
    {
      'name': 'Kane',
      'hints': ['İngiliz', 'Tottenham\'da oynuyor', 'Güçlü forvet']
    },
    {
      'name': 'Modric',
      'hints': ['Hırvat', 'Real Madrid\'de oynuyor', 'Orta sahada güçlü']
    },
    {
      'name': 'Benzema',
      'hints': ['Fransız', 'Real Madrid\'de oynadı', 'Top sürme ustası']
    },
    {
      'name': 'Kroos',
      'hints': ['Alman', 'Real Madrid\'de oynuyor', 'Pas yeteneği güçlü']
    },
    {
      'name': 'Suarez',
      'hints': ['Uruguaylı', 'Dişleme olayıyla ünlü', 'Barcelona\'da oynadı']
    },
    {
      'name': 'Lewandowski',
      'hints': ['Polonyalı', 'Bayern Münih\'te yıldızlaştı', 'Gol kralı']
    },
    {
      'name': 'De Bruyne',
      'hints': ['Belçikalı', 'Manchester City\'de oynuyor', 'Asist ustası']
    },
    {
      'name': 'Mane',
      'hints': ['Senegalli', 'Liverpool\'da parladı', 'Hızlı kanat oyuncusu']
    },
    {
      'name': 'Ibrahimovic',
      'hints': ['İsveçli', 'Lakabı "Ibra"', 'Birçok farklı ligde oynadı']
    },
    {
      'name': 'Di Maria',
      'hints': ['Arjantinli', 'PSG ve Real Madrid\'de oynadı', 'Hızlı kanat']
    },
    {
      'name': 'Kante',
      'hints': ['Fransız', 'Chelsea\'de yıldızlaştı', 'Defansif orta saha']
    },
    {
      'name': 'Verratti',
      'hints': ['İtalyan', 'PSG\'de oynuyor', 'Orta sahada yaratıcı']
    },
    {
      'name': 'Pogba',
      'hints': ['Fransız', 'Manchester United\'da oynadı', 'Orta saha devi']
    },
    {
      'name': 'Ramos',
      'hints': ['İspanyol', 'Real Madrid kaptanıydı', 'Savunmada sert']
    },
    {
      'name': 'Van Dijk',
      'hints': ['Hollandalı', 'Liverpool\'da oynuyor', 'Savunma lideri']
    },
    {
      'name': 'Alisson',
      'hints': ['Brezilyalı', 'Liverpool\'da kaleci', 'Refleksleri güçlü']
    },
    {
      'name': 'Oblak',
      'hints': ['Sloven', 'Atletico Madrid\'de kaleci', 'Sert savunmacı']
    },
    {
      'name': 'Ter Stegen',
      'hints': ['Alman', 'Barcelona\'da kaleci', 'Topla iyi oynuyor']
    },
    {
      'name': 'Courtois',
      'hints': ['Belçikalı', 'Real Madrid\'de kaleci', 'Uzun boylu']
    },
    {
      'name': 'Pique',
      'hints': ['İspanyol', 'Barcelona\'da oynadı', 'Savunmada sakin']
    },
    {
      'name': 'Marcelo',
      'hints': ['Brezilyalı', 'Real Madrid\'de oynadı', 'Ofansif bek']
    },
    {
      'name': 'Haaland',
      'hints': ['Norveçli', 'Güçlü forvet', 'Manchester City\'de oynuyor']
    },
    {
      'name': 'Griezmann',
      'hints': [
        'Fransız',
        'Barcelona ve Atletico Madrid\'de oynadı',
        'Hızlı forvet'
      ]
    },
    {
      'name': 'Dybala',
      'hints': ['Arjantinli', 'Juventus\'ta yıldızlaştı', 'Teknik forvet']
    },
    {
      'name': 'Son',
      'hints': ['Güney Koreli', 'Tottenham\'da oynuyor', 'Hızlı kanat']
    },
    {
      'name': 'Aubameyang',
      'hints': ['Gabonlu', 'Hızlı forvet', 'Arsenal ve Barcelona\'da oynadı']
    },
    {
      'name': 'Depay',
      'hints': ['Hollandalı', 'Barcelona\'da oynadı', 'Top sürme yetenekli']
    },
    {
      'name': 'Sancho',
      'hints': ['İngiliz', 'Manchester United\'da oynuyor', 'Genç yetenek']
    },
    {
      'name': 'Sterling',
      'hints': ['İngiliz', 'Chelsea\'de oynuyor', 'Hızlı ve çevik']
    },
    {
      'name': 'Lukaku',
      'hints': ['Belçikalı', 'İnter ve Chelsea\'de oynadı', 'Güçlü forvet']
    },
    {
      'name': 'Eriksen',
      'hints': [
        'Danimarkalı',
        'Inter ve Manchester United\'da oynadı',
        'Orta saha'
      ]
    },
    {
      'name': 'Firmino',
      'hints': ['Brezilyalı', 'Liverpool\'da oynadı', 'Forvet']
    },
    {
      'name': 'James',
      'hints': ['Kolombiyalı', 'Real Madrid\'de oynadı', 'Orta saha']
    },
    {
      'name': 'Thiago',
      'hints': [
        'İspanyol',
        'Bayern ve Liverpool\'da oynadı',
        'Teknik orta saha'
      ]
    },
    {
      'name': 'Muller',
      'hints': ['Alman', 'Bayern Münih\'te yıldızlaştı', 'Forvet arkası']
    },
    {
      'name': 'Isco',
      'hints': ['İspanyol', 'Real Madrid\'de oynadı', 'Yaratıcı orta saha']
    },
    {
      'name': 'Zyech',
      'hints': ['Faslı', 'Chelsea\'de oynuyor', 'Solak kanat oyuncusu']
    },
    {
      'name': 'Felix',
      'hints': ['Portekizli', 'Atletico Madrid\'de oynuyor', 'Genç yetenek']
    },
    {
      'name': 'Richarlison',
      'hints': ['Brezilyalı', 'Everton ve Tottenham\'da oynadı', 'Güçlü forvet']
    },
  ];

  late Map<String, dynamic> currentPlayer;
  List<String> revealedHints = [];
  String userGuess = '';
  bool isGameOver = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  int attempts = 0;
  String incorrectGuessMessage = ''; // Yanlış tahmin mesajı için değişken

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    startNewGame();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void startNewGame() {
    setState(() {
      currentPlayer = players[Random().nextInt(players.length)];
      revealedHints = [];
      userGuess = '';
      isGameOver = false;
      attempts = 0;
      incorrectGuessMessage = '';
    });
    _animationController.reset();
  }

  void revealHint() {
    if (revealedHints.length < 3) {
      setState(() {
        revealedHints.add(currentPlayer['hints'][revealedHints.length]);
      });
      _animationController.forward(from: 0.0);
    }
  }

  void checkAnswer() {
    setState(() {
      attempts++;
      if (userGuess.toLowerCase() == currentPlayer['name'].toLowerCase()) {
        isGameOver = true;
      } else {
        incorrectGuessMessage = 'Yanlış cevap: $userGuess';
        // Yanlış cevabı 5 saniye sonra temizle
        Timer(Duration(seconds: 5), () {
          setState(() {
            incorrectGuessMessage = '';
          });
        });
      }
      if (attempts >= 3) {
        isGameOver = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Futbolcu Tahmin Oyunu'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF121212),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'İpuçları:',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      if (index < revealedHints.length) {
                        return FadeTransition(
                          opacity: _animation,
                          child: Card(
                            color: Theme.of(context).colorScheme.surface,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                revealedHints[index],
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Card(
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              '???',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white54),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 16),
                if (!isGameOver && revealedHints.length < 3)
                  ElevatedButton(
                    child: Text('İpucu Göster'),
                    onPressed: revealHint,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Futbolcunun adını girin',
                    fillColor: Theme.of(context).colorScheme.surface,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    userGuess = value;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Text('Tahmin Et'),
                  onPressed: isGameOver ? null : checkAnswer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                if (incorrectGuessMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      incorrectGuessMessage,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (isGameOver)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      userGuess.toLowerCase() ==
                              currentPlayer['name'].toLowerCase()
                          ? 'Tebrikler! Doğru tahmin ettiniz.'
                          : 'Yanlış tahmin. Doğru cevap: ${currentPlayer['name']}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (isGameOver)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(
                      child: Text('Yeni Oyun'),
                      onPressed: startNewGame,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
