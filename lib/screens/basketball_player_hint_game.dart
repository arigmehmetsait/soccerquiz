import 'package:flutter/material.dart';
import 'dart:math';

class BasketballPlayerHintGame extends StatefulWidget {
  @override
  _BasketballPlayerHintGameState createState() =>
      _BasketballPlayerHintGameState();
}

class _BasketballPlayerHintGameState extends State<BasketballPlayerHintGame> {
  final List<Map<String, dynamic>> players = [
    {
      'name': 'LeBron',
      'hints': [
        '4 kez NBA şampiyonu',
        'Lakers\'ta oynuyor',
        'Lakabı "King James"'
      ]
    },
    {
      'name': 'Curry',
      'hints': [
        'Warriors\'ın yıldız oyun kurucusu',
        '3 sayı atışlarıyla ünlü',
        '2 kez MVP seçildi'
      ]
    },
    {
      'name': 'Durant',
      'hints': ['2.08 metre boyunda', 'Nets\'te oynuyor', '2014 MVP\'si']
    },
    {
      'name': 'Giannis',
      'hints': ['Yunan asıllı', 'Bucks\'ın yıldızı', 'Lakabı "Greek Freak"']
    },
    {
      'name': 'Jokic',
      'hints': ['Sırp pivot', 'Nuggets\'ta oynuyor', '2021 MVP\'si']
    },
    {
      'name': 'Doncic',
      'hints': [
        'Sloven yıldız',
        'Mavericks\'te oynuyor',
        'Genç yaşta yıldızlaştı'
      ]
    },
    {
      'name': 'Embiid',
      'hints': ['Kamerunlu pivot', '76ers\'da oynuyor', '2022 MVP adayı']
    },
    {
      'name': 'Lillard',
      'hints': [
        'Trail Blazers\'ın lideri',
        'Uzun mesafeli şutlarıyla ünlü',
        'Lakabı "Dame Time"'
      ]
    },
    {
      'name': 'Harden',
      'hints': [
        'Brooklyn Nets\'te oynuyor',
        'Skor üretme becerisi yüksek',
        'Lakabı "The Beard"'
      ]
    },
    {
      'name': 'Tatum',
      'hints': [
        'Celtics\'te oynuyor',
        'Forvet pozisyonunda',
        'Genç yaşta NBA All-Star oldu'
      ]
    },
    {
      'name': 'Kyrie',
      'hints': [
        'Yetenekli oyun kurucu',
        'Nets\'te oynuyor',
        'Mükemmel top sürüş becerisi'
      ]
    },
    {
      'name': 'Davis',
      'hints': [
        'Lakers\'ta oynuyor',
        'Yetenekli bir savunmacı',
        'Lakabı "The Brow"'
      ]
    },
    {
      'name': 'Booker',
      'hints': [
        'Suns\'ta oynuyor',
        'Skorer oyunuyla tanınıyor',
        'Kobe Bryant\'ı idol olarak görüyor'
      ]
    },
    {
      'name': 'Mitchell',
      'hints': ['Jazz\'da oynuyor', 'Lakabı "Spida"', 'Yetenekli bir şutör']
    },
    {
      'name': 'Trae',
      'hints': [
        'Hawks\'ın yıldızı',
        'Skor üretme becerisi yüksek',
        'Genç yaşta dikkat çekti'
      ]
    },
    {
      'name': 'Jimmy',
      'hints': [
        'Heat\'te oynuyor',
        'Lakabı "Jimmy Buckets"',
        '2020 NBA Finalleri\'nde yer aldı'
      ]
    },
    {
      'name': 'George',
      'hints': [
        'Clippers\'ta oynuyor',
        'Defansif yetenekleri güçlü',
        'Lakabı "PG13"'
      ]
    },
    {
      'name': 'Zion',
      'hints': [
        'Pelicans\'ta oynuyor',
        'Fiziksel gücüyle tanınıyor',
        'Duke Üniversitesi\'nde yıldızlaştı'
      ]
    },
    {
      'name': 'Ja',
      'hints': [
        'Grizzlies\'te oynuyor',
        'Çok atletik bir guard',
        'Genç yaşta NBA All-Star oldu'
      ]
    },
    {
      'name': 'Beal',
      'hints': [
        'Wizards\'ın yıldızı',
        'Yüksek skorer bir şutör',
        'Birçok kez All-Star seçildi'
      ]
    },
    {
      'name': 'Russell',
      'hints': [
        'Triple-double kralı',
        'Lakers\'ta oynuyor',
        'Enerjik bir oyun stili var'
      ]
    },
    {
      'name': 'CP3',
      'hints': [
        'Tecrübeli oyun kurucu',
        'Suns\'ta oynuyor',
        '9 kez All-Star oldu'
      ]
    },
    {
      'name': 'Towns',
      'hints': [
        'Timberwolves\'ta oynuyor',
        'Uzun forvet ve pivot oynuyor',
        'Dominik Cumhuriyeti asıllı'
      ]
    },
    {
      'name': 'Simmons',
      'hints': [
        'Yetenekli bir oyun kurucu',
        'Savunmada güçlü',
        '76ers\'da oynuyordu'
      ]
    },
    {
      'name': 'Jaylen',
      'hints': [
        'Celtics\'in kanat oyuncusu',
        'Atletik yetenekleriyle tanınıyor',
        'Genç yaşta All-Star oldu'
      ]
    },
    {
      'name': 'Ayton',
      'hints': [
        'Suns\'ta pivot pozisyonunda oynuyor',
        'Bahama asıllı',
        'Çok güçlü bir reboundcu'
      ]
    },
    {
      'name': 'DeRozan',
      'hints': [
        'Bulls\'ta oynuyor',
        'Skorer forvet',
        'Yetenekli bir orta mesafe şutör'
      ]
    },
    {
      'name': 'Randle',
      'hints': [
        'Knicks\'te oynuyor',
        'Fiziksel forvet',
        '2021\'de En Çok Gelişen Oyuncu ödülünü aldı'
      ]
    },
    {
      'name': 'Klay',
      'hints': [
        'Warriors\'ta şutör guard',
        'Üç sayılık atış ustası',
        'Splash Brothers\'ın bir üyesi'
      ]
    },
    {
      'name': 'Draymond',
      'hints': [
        'Warriors\'ta oynuyor',
        'Savunma uzmanı',
        'Çok yönlü bir oyuncu'
      ]
    },
    {
      'name': 'Vucevic',
      'hints': ['Bulls\'ta pivot', 'Karadağ asıllı', 'Skorer bir uzun oyuncu']
    },
    {
      'name': 'Brogdon',
      'hints': [
        'Celtics\'te oynuyor',
        'Savunmasıyla bilinir',
        'İlk yılında Yılın Çaylağı ödülünü kazandı'
      ]
    },
    {
      'name': 'Jonas',
      'hints': ['Pelicans\'ta pivot', 'Litvanyalı', 'Güçlü bir reboundcu']
    },
    {
      'name': 'Danilo',
      'hints': [
        'İtalyan forvet',
        'Üç sayı tehdidi',
        'Fiziksel avantajı kullanır'
      ]
    },
    {
      'name': 'Collin',
      'hints': ['Jazz\'da oynuyor', 'Skorer guard', 'Genç yaşta dikkat çekti']
    },
    {
      'name': 'Jrue',
      'hints': [
        'Bucks\'ta oynuyor',
        'Yetenekli bir savunmacı',
        '2021 NBA şampiyonu'
      ]
    },
    {
      'name': 'LaVine',
      'hints': [
        'Bulls\'un skorer guardı',
        'Atletik yetenekleri güçlü',
        'Smaç yarışmasını kazandı'
      ]
    }
  ];

  late Map<String, dynamic> currentPlayer;
  List<String> revealedHints = [];
  String userGuess = '';
  int remainingGuesses = 3;
  bool isGameOver = false;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      currentPlayer = players[Random().nextInt(players.length)];
      revealedHints = [];
      userGuess = '';
      remainingGuesses = 3;
      isGameOver = false;
    });
  }

  void revealHint() {
    if (revealedHints.length < 3) {
      setState(() {
        revealedHints.add(currentPlayer['hints'][revealedHints.length]);
      });
    }
  }

  void checkAnswer() {
    setState(() {
      if (userGuess.trim().toLowerCase() ==
          currentPlayer['name'].toLowerCase()) {
        isGameOver = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tebrikler! Doğru tahmin ettiniz.'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        remainingGuesses--;
        if (remainingGuesses > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Yanlış tahmin! $remainingGuesses tahmin hakkınız kaldı.'),
              duration: Duration(seconds: 5), // 5 saniye sonra kaybolur
            ),
          );
        } else {
          isGameOver = true;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Yanlış tahmin! Doğru cevap: ${currentPlayer['name']}'),
              duration: Duration(seconds: 5), // 5 saniye sonra kaybolur
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basketbolcu Tahmin Oyunu'),
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
                        return Card(
                          color: Theme.of(context).colorScheme.surface,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              revealedHints[index],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
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
                    hintText: 'Basketbolcunun adını girin',
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
