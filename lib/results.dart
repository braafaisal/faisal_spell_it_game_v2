import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spell_it_game/game_provider.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int score = ModalRoute.of(context)?.settings.arguments as int;
    // final int score = ModalRoute.of(context)!.settings.arguments as int;
    final int totalWords =
        10; // اجعل هذا العدد ديناميكيًا إذا كانت لديك طريقة لجلب العدد الكلي للكلمات
    final double percentage = (score / totalWords) * 100;
    String getEmoji() {
      if (percentage >= 90) {
        return '🎉'; // ممتاز
      } else if (percentage >= 75) {
        return '😊'; // جيد جدا
      } else if (percentage >= 50) {
        return '🙂'; // جيد
      } else {
        return '😢'; // حاول مرة أخرى
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        automaticallyImplyLeading: false, // Prevent back button
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Your final score is: $score',
              //   style: TextStyle(fontSize: 24),
              // ),
              // SizedBox(height: 20),

              Text(
                'Your Score: $score/$totalWords',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Percentage: ${percentage.toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                getEmoji(),
                style: TextStyle(fontSize: 100),
              ),
              ElevatedButton(
                onPressed: () {
                  // Provider.of<GameProvider>(context, listen: false).resetGame();
                  Navigator.pushReplacementNamed(context, '/historyList');
                },
                child: Text('wordList'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Provider.of<GameProvider>(context, listen: false).resetGame();
                  Provider.of<GameProvider>(context, listen: false).goToHome();
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text('Home'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Provider.of<GameProvider>(context, listen: false).resetGame();
                  Provider.of<GameProvider>(context, listen: false)
                      .showWordList();
                  Navigator.pushReplacementNamed(context, '/wordListpage');
                },
                child: Text('wordListpage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


 /**
  * 
  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spell_it_game/dashboard_page.dart';
import 'package:spell_it_game/game_provider.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final int score = ModalRoute.of(context)?.settings.arguments as int;
    final int score = ModalRoute.of(context)!.settings.arguments as int;
    final int totalWords =
        10; // اجعل هذا العدد ديناميكيًا إذا كانت لديك طريقة لجلب العدد الكلي للكلمات
    final double percentage = (score / totalWords) * 100;

    String getEmoji() {
      if (percentage >= 90) {
        return '🎉'; // ممتاز
      } else if (percentage >= 75) {
        return '😊'; // جيد جدا
      } else if (percentage >= 50) {
        return '🙂'; // جيد
      } else {
        return '😢'; // حاول مرة أخرى
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        automaticallyImplyLeading: false, // Prevent back button
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score/$totalWords',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Percentage: ${percentage.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              getEmoji(),
              style: TextStyle(fontSize: 100),
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     Provider.of<GameProvider>(context, listen: false).resetGame();
            //     Navigator.pushReplacementNamed(context, '/game');
            //   },
            //   child: Text('Play Again'),
            // ),
            // SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Provider.of<GameProvider>(context, listen: false).resetGame();
                Provider.of<GameProvider>(context, listen: false).goToHome();
                // Navigator.pushReplacementNamed(context, '/');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DashboardPage()),
                    ModalRoute.withName('/'));
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
 

// class ResultsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
  

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Results'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Your Score: $score/$totalWords',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Percentage: ${percentage.toStringAsFixed(2)}%',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             Text(
//               getEmoji(),
//               style: TextStyle(fontSize: 100),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushReplacementNamed(context, '/dashboard');
//               },
//               child: Text('Play Again'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  */