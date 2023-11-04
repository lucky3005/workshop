import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liked Words App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<String> _likedWords = [];

  final List<String> _randomWords = [
    'Flutter',
    'Dart',
    'Widget',
    'Mobile',
    'App',
    'Development',
  ];

  String _generateRandomWord() {
    final random = Random();
    return _randomWords[random.nextInt(_randomWords.length)];
  }

  @override
  Widget build(BuildContext context) {
    String randomWord = _generateRandomWord();

    return Scaffold(
      appBar: AppBar(
        title: Text('Random Words App'),
      ),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Icon(Icons.add_a_photo_sharp),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  
                  builder: (context) => LikedWordsPage(_likedWords),
                ),
              );
            },
          ),
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              randomWord,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                setState(() {
                  _likedWords.add(randomWord);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LikedWordsPage extends StatelessWidget {
  final List<String> likedWords;

  LikedWordsPage(this.likedWords);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Words'),
      ),
      body: ListView.builder(
        itemCount: likedWords.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(likedWords[index]),
          );
        },
      ),
    );
  }
}
