import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spell_it_game/game_provider.dart';

class WordListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Provider.of<GameProvider>(context, listen: false).goToHome();
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(
                Icons.home,
                color: Colors.red,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // Provider.of<GameProvider>(context, listen: false).resetGame();
                  Navigator.pushReplacementNamed(context, '/historyList');
                },
                icon: Icon(
                  Icons.history,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: gameProvider.words.length,
            itemBuilder: (context, index) {
              String word = gameProvider.words[index];
              return Card(
                color: Colors.blue.shade500,
                child: ListTile(
                  title: Text(
                    word,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.volume_up),
                    onPressed: () {
                      gameProvider.speakWord(word);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
