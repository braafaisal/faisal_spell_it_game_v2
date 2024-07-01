// import 'package:flutter/material.dart';
// import 'dart:async';

// class TimerProvider extends ChangeNotifier {
//   int _remainingTime = 60; // Default timer value in seconds
//   int _initialTime = 60;
//   Timer? _timer;
//   bool _isRunning = false;

//   int get remainingTime => _remainingTime;
//   int get initialTime => _initialTime;
//   bool get isRunning => _isRunning;

//   void startTimer(BuildContext context) {
//     if (_timer != null || _remainingTime == 0) return;

//     _isRunning = true;
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_remainingTime > 0) {
//         _remainingTime--;
//         notifyListeners();
//       } else {
//         _timer?.cancel();
//         _timer = null;
//         _remainingTime = _initialTime;
//         _isRunning = false;
//         notifyListeners();

//         // Navigate to the results page when the timer ends
//         Navigator.pushReplacementNamed(context, '/results');
//       }
//     });
//   }

//   void pauseTimer() {
//     _timer?.cancel();
//     _timer = null;
//     _isRunning = false;
//     notifyListeners();
//   }

//   void resetTimer() {
//     _timer?.cancel();
//     _timer = null;
//     _remainingTime = _initialTime;
//     _isRunning = false;
//     notifyListeners();
//   }

//   void setTime(int seconds) {
//     _remainingTime = seconds;
//     _initialTime = seconds;
//     notifyListeners();
//   }
// }
