// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Home Page'),
//       // ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(context, '/game');
//           },
//           child: Text('Start Game'),
//         ),
//       ),
//     );
//   }
// }


/**

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spell It Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/words');
              },
              child: Text('Words Screen'),
            ),
            SizedBox(
              width: double.infinity, // Example: match parent width
              height: 50, // Example: fixed height
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                child: Text('Game Screen'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              child: Text('History Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

 */