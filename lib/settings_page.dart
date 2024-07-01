// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:spell_it_game/timer_provider.dart';

// class SettingsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final timerProvider = Provider.of<TimerProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//               'Select Quiz Duration:',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _showTimePicker(context, timerProvider),
//               child: Text('Set Duration'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Current Duration: ${_formatTime(timerProvider.initialTime)}',
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showTimePicker(BuildContext context, TimerProvider timerProvider) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return SizedBox(
//           height: 300,
//           child: CupertinoTimerPicker(
//             mode: CupertinoTimerPickerMode.hms,
//             initialTimerDuration: Duration(seconds: timerProvider.initialTime),
//             onTimerDurationChanged: (Duration newDuration) {
//               if (newDuration.inSeconds > 0) {
//                 timerProvider.setTime(newDuration.inSeconds);
//               }
//             },
//           ),
//         );
//       },
//     );
//   }

//   String _formatTime(int totalSeconds) {
//     int hours = totalSeconds ~/ 3600;
//     int minutes = (totalSeconds % 3600) ~/ 60;
//     int seconds = totalSeconds % 60;

//     return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
//   }
// }
