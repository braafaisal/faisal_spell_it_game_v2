// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:spell_it_game/customDialog%20.dart';
// import 'package:spell_it_game/spell_service.dart';
// import 'dart:async';

// class GameProvider with ChangeNotifier {
//   final SpellService _spellService = SpellService();
//   final FlutterTts _flutterTts = FlutterTts();

//   List<String> _words = [];
//   bool _loading = true;
//   bool _error = false;
//   String _errorMessage = '';
//   int _currentWordIndex = 0;
//   int _score = 0;
//   List<bool> _wordStatuses = []; // New list to track the status of each word

//   int _remainingTime = 60; // Default timer value in seconds
//   Timer? _timer;
//   bool _isRunning = false;

//   List<String> get words => _words;
//   bool get loading => _loading;
//   bool get error => _error;
//   String get errorMessage => _errorMessage;
//   int get currentWordIndex => _currentWordIndex;
//   int get score => _score;
//   List<bool> get wordStatuses => _wordStatuses; // Getter for the statuses

//   int get remainingTime => _remainingTime;
//   bool get isRunning => _isRunning;

//   GameProvider() {
//     loadWords();
//   }

//   Future<void> loadWords() async {
//     try {
//       List<String> words = await _spellService.fetchWords();
//       _words = words;
//       _wordStatuses =
//           List<bool>.filled(words.length, false); // Initialize the statuses
//       _loading = false;
//       _error = false;
//       notifyListeners();
//       if (_words.isNotEmpty) {
//         speakWord(_words[_currentWordIndex]);
//       } else {
//         _error = true;
//         _errorMessage = 'No words found.';
//         notifyListeners();
//       }
//       startTimer(); // Start the timer when words are loaded
//     } catch (e) {
//       _loading = false;
//       _error = true;
//       _errorMessage = 'Failed to load words: $e';
//       notifyListeners();
//       print('Failed to load words: $e');
//     }
//   }

//   Future<void> speakWord(String word) async {
//     await _flutterTts.speak(word);
//     print(word);
//     notifyListeners();
//   }

//   Future<void> stopSpeak() async {
//     await _flutterTts.stop();
//   }

//   void checkAnswer(BuildContext context, String userAnswer) {
//     userAnswer = userAnswer.trim().toLowerCase();
//     String correctAnswer = _words[_currentWordIndex].toLowerCase();

//     if (userAnswer == correctAnswer) {
//       _score++;
//       _wordStatuses[_currentWordIndex] = true; // Mark as correct
//       _showDialog(context, 'Correct!', 'Good job! The word is $correctAnswer.');
//     } else {
//       _wordStatuses[_currentWordIndex] = false; // Mark as incorrect
//       _showDialog(
//           context, 'Incorrect!', 'Try again! The word is $correctAnswer.');
//     }

//     _currentWordIndex++;

//     notifyListeners();
//   }

//   void _showDialog(BuildContext context, String title, String content) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return CustomDialog(
//           title: title,
//           content: content,
//           onOkPressed: () {
//             if (_currentWordIndex < _words.length) {
//               speakWord(_words[_currentWordIndex]);
//             } else {
//               _showDialog(context, 'Game Over', 'Your final score is $_score.');
//             }

//             if (title == 'Game Over') {
//               Navigator.pushReplacementNamed(context, '/results',
//                   arguments: _score);
//             }
//           },
//         );
//       },
//     );
//   }

//   void resetGame() {
//     _currentWordIndex = 0;
//     _score = 0;
//     _loading = true;
//     _error = false;
//     _errorMessage = '';
//     _remainingTime = 60; // Reset the timer
//     loadWords();
//     stopTimer(); // Stop any running timer
//     notifyListeners();
//   }

//   void goToHome() {
//     stopSpeak();
//     resetGame();
//   }

//   // Timer related methods
//   void startTimer() {
//     if (_timer != null || _remainingTime == 0) return;

//     _isRunning = true;
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_remainingTime > 0) {
//         _remainingTime--;
//         notifyListeners();
//       } else {
//         _timer?.cancel();
//         _timer = null;
//         _isRunning = false;
//         notifyListeners();
//         stopSpeak(); // Stop speaking when the timer ends
//         Future.delayed(Duration(seconds: 3), () {
//           Navigator.pushReplacementNamed(_context!, '/results',
//               arguments: _score);
//         });
//       }
//     });
//   }

//   void stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//     _isRunning = false;
//     notifyListeners();
//   }

//   // Context to be used for showing dialog
//   BuildContext? _context;
//   void setContext(BuildContext context) {
//     _context = context;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:spell_it_game/customDialog%20.dart';
import 'package:spell_it_game/spell_service.dart';
import 'dart:async';

class GameProvider with ChangeNotifier {
  final SpellService _spellService = SpellService();
  final FlutterTts _flutterTts = FlutterTts();

  List<String> _words = [];
  bool _loading = true;
  bool _error = false;
  String _errorMessage = '';
  int _currentWordIndex = 0;
  int _score = 0;
  List<bool> _wordStatuses = [];

  int _remainingTime = 60;
  Timer? _timer;
  bool _isRunning = false;

  List<String> get words => _words;
  bool get loading => _loading;
  bool get error => _error;
  String get errorMessage => _errorMessage;
  int get currentWordIndex => _currentWordIndex;
  int get score => _score;
  List<bool> get wordStatuses => _wordStatuses;

  int get remainingTime => _remainingTime;
  bool get isRunning => _isRunning;

  GameProvider() {
    loadWords();
  }

  Future<void> loadWords() async {
    try {
      List<String> words = await _spellService.fetchWords();
      _words = words;
      _wordStatuses = List<bool>.filled(words.length, false);
      _loading = false;
      _error = false;
      notifyListeners();
      if (_words.isNotEmpty) {
        speakWord(_words[_currentWordIndex]);
        startTimer();
      } else {
        _error = true;
        _errorMessage = 'No words found.';
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      _error = true;
      _errorMessage = 'Failed to load words: $e';
      notifyListeners();
      print('Failed to load words: $e');
    }
  }

  Future<void> speakWord(String word) async {
    await _flutterTts.speak(word);
    print(word);
    notifyListeners();
  }

  Future<void> stopSpeak() async {
    await _flutterTts.stop();
  }

  void checkAnswer(BuildContext context, String userAnswer) {
    userAnswer = userAnswer.trim().toLowerCase();
    String correctAnswer = _words[_currentWordIndex].toLowerCase();

    if (userAnswer == correctAnswer) {
      _score++;
      _wordStatuses[_currentWordIndex] = true;
      _showDialog(context, 'Correct!', 'Good job! The word is $correctAnswer.');
    } else {
      _wordStatuses[_currentWordIndex] = false;
      _showDialog(
          context, 'Incorrect!', 'Try again! The word is $correctAnswer.');
    }

    _currentWordIndex++;
    notifyListeners();
  }

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: title,
          content: content,
          onOkPressed: () {
            if (_currentWordIndex < _words.length) {
              speakWord(_words[_currentWordIndex]);
            } else {
              _showDialog(context, 'Game Over', 'Your final score is $_score.');
            }

            if (title == 'Game Over') {
              Navigator.pushReplacementNamed(context, '/results',
                  arguments: _score);
            }
          },
        );
      },
    );
  }

  void resetGame() {
    _currentWordIndex = 0;
    _score = 0;
    _loading = true;
    _error = false;
    _errorMessage = '';
    _remainingTime = 60;
    loadWords();
    stopTimer();
    notifyListeners();
  }

  void showWordList() {
    stopSpeak();
    _loading = true;
    _error = false;
    _errorMessage = '';
    stopTimer();
    notifyListeners();
  }

  void goToHome() {
    stopSpeak();
    resetGame();
  }

  // Timer related methods
  void startTimer() {
    if (_timer != null || _remainingTime == 0) return;

    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        notifyListeners();
      } else {
        _timer?.cancel();
        _timer = null;
        _isRunning = false;
        notifyListeners();
        stopSpeak();
        Future.delayed(Duration(milliseconds: 300), () {
          Navigator.pushReplacementNamed(_context!, '/results',
              arguments: _score);
        });
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    notifyListeners();
  }

  // Context to be used for showing dialog
  BuildContext? _context;
  void setContext(BuildContext context) {
    _context = context;
  }
}
