// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:spell_it_game/game_provider.dart';
// // import 'package:spell_it_game/history_widget.dart';

// // class GamePage extends StatelessWidget {
// //   final TextEditingController _controller = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     final gameProvider = Provider.of<GameProvider>(context);
// //     gameProvider.setContext(context); // Pass context to GameProvider

// //     return WillPopScope(
// //       onWillPop: () async => false, // Prevent back button
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Made By Faisal Elazhary'),
// //           leading: Container(), // Hide back button
// //           actions: [
// //             IconButton(
// //               icon: Icon(Icons.refresh),
// //               onPressed: () {
// //                 gameProvider.resetGame();
// //               },
// //             ),
// //           ],
// //         ),
// //         body: Consumer<GameProvider>(
// //           builder: (context, gameProvider, child) {
// //             if (gameProvider.loading) {
// //               return Center(child: CircularProgressIndicator());
// //             } else if (gameProvider.error) {
// //               return Center(child: Text(gameProvider.errorMessage));
// //             } else if (gameProvider.currentWordIndex >=
// //                 gameProvider.words.length) {
// //               WidgetsBinding.instance.addPostFrameCallback((_) {
// //                 Navigator.pushReplacementNamed(context, '/results',
// //                     arguments: gameProvider.score);
// //               });
// //               return Center(child: CircularProgressIndicator());
// //             } else {
// //               return Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: SingleChildScrollView(
// //                   child: Column(
// //                     children: <Widget>[
// //                       Text(
// //                         'Spell the word:',
// //                         style: TextStyle(fontSize: 24),
// //                       ),
// //                       SizedBox(height: 20),
// //                       TextButton.icon(
// //                         onPressed: () {
// //                           gameProvider.speakWord(gameProvider
// //                               .words[gameProvider.currentWordIndex]);
// //                         },
// //                         icon: Icon(Icons.volume_up),
// //                         label: Text('Hear Word Again'),
// //                       ),
// //                       SizedBox(height: 20),
// //                       TextField(
// //                         controller: _controller,
// //                         decoration: InputDecoration(
// //                           border: OutlineInputBorder(),
// //                           labelText: 'Enter the word',
// //                         ),
// //                       ),
// //                       SizedBox(height: 20),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           gameProvider.checkAnswer(context, _controller.text);
// //                           _controller.clear();
// //                         },
// //                         child: Text('Submit'),
// //                       ),
// //                       SizedBox(height: 20),
// //                       Text('Score: ${gameProvider.score}'),
// //                       SizedBox(height: 20),
// //                       HistoryWidget(), // Add HistoryWidget here
// //                       SizedBox(height: 20),
// //                       Text(
// //                         'Time remaining: ${_formatTime(gameProvider.remainingTime)}',
// //                         style: TextStyle(fontSize: 24, color: Colors.red),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }

// //   // Formats the remaining time into a readable string (MM:SS).
// //   String _formatTime(int totalSeconds) {
// //     int minutes = totalSeconds ~/ 60;
// //     int seconds = totalSeconds % 60;
// //     return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:spell_it_game/game_provider.dart';
// import 'package:spell_it_game/history_widget.dart';

// class GamePage extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final gameProvider = Provider.of<GameProvider>(context);
//     gameProvider.setContext(context);

//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Made By Faisal Elazhary'),
//           leading: Container(),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.refresh),
//               onPressed: () {
//                 gameProvider.resetGame();
//               },
//             ),
//           ],
//         ),
//         body: Consumer<GameProvider>(
//           builder: (context, gameProvider, child) {
//             if (gameProvider.loading) {
//               return Center(child: CircularProgressIndicator());
//             } else if (gameProvider.error) {
//               return Center(child: Text(gameProvider.errorMessage));
//             } else if (gameProvider.currentWordIndex >=
//                 gameProvider.words.length) {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 Navigator.pushReplacementNamed(context, '/results',
//                     arguments: gameProvider.score);
//               });
//               return Center(child: CircularProgressIndicator());
//             } else {
//               return Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         'Spell the word:',
//                         style: TextStyle(fontSize: 24),
//                       ),
//                       SizedBox(height: 20),
//                       TextButton.icon(
//                         onPressed: () {
//                           gameProvider.speakWord(gameProvider
//                               .words[gameProvider.currentWordIndex]);
//                         },
//                         icon: Icon(Icons.volume_up),
//                         label: Text('Hear Word Again'),
//                       ),
//                       SizedBox(height: 20),
//                       TextField(
//                         controller: _controller,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Enter the word',
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: () {
//                           gameProvider.checkAnswer(context, _controller.text);
//                           _controller.clear();
//                         },
//                         child: Text('Submit'),
//                       ),
//                       SizedBox(height: 20),
//                       Text('Score: ${gameProvider.score}'),
//                       SizedBox(height: 20),
//                       HistoryWidget(),
//                       SizedBox(height: 20),
//                       Text(
//                         'Time remaining: ${_formatTime(gameProvider.remainingTime)}',
//                         style: TextStyle(fontSize: 24, color: Colors.red),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   String _formatTime(int totalSeconds) {
//     int minutes = totalSeconds ~/ 60;
//     int seconds = totalSeconds % 60;
//     return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spell_it_game/game_provider.dart';
// import 'package:spell_it_game/history_widget.dart';
// import 'package:spell_it_game/history_widget.dart';

class GamePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    gameProvider.setContext(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Made By Faisal Elazhary'),
          leading: Container(),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                gameProvider.resetGame();
              },
            ),
          ],
        ),
        body: Consumer<GameProvider>(
          builder: (context, gameProvider, child) {
            if (gameProvider.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (gameProvider.error) {
              return Center(child: Text(gameProvider.errorMessage));
            } else if (gameProvider.currentWordIndex >=
                gameProvider.words.length) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, '/results',
                    arguments: gameProvider.score);
              });
              return Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Text(
                        //   'Spell the word:',
                        //   style: TextStyle(fontSize: 24),
                        // ),
                        // SizedBox(height: 20),
                        TextButton.icon(
                          onPressed: () {
                            gameProvider.speakWord(gameProvider
                                .words[gameProvider.currentWordIndex]);
                          },
                          icon: Icon(Icons.volume_up),
                          label: Text('Hear Word Again'),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter the word',
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            gameProvider.checkAnswer(context, _controller.text);
                            _controller.clear();
                          },
                          child: Text('Submit'),
                        ),
                        SizedBox(height: 20),
                        Text('Score: ${gameProvider.score}'),
                        SizedBox(height: 20),
                        // HistoryWidget(),
                        // SizedBox(height: 20),
                        Text(
                          'Time remaining: ${_formatTime(gameProvider.remainingTime)}',
                          style: TextStyle(fontSize: 24, color: Colors.red),
                        ),
                        // SizedBox(height: 20),
                        Text(
                          'Word ${gameProvider.currentWordIndex + 1} of ${gameProvider.words.length}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        // LinearProgressIndicator(
                        //   value: (gameProvider.currentWordIndex + 1) /
                        //       gameProvider.words.length,
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
