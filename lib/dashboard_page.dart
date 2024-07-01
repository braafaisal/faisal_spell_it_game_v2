// // // import 'package:flutter/material.dart';
// // // import 'package:spell_it_game/game.dart';
// // // import 'package:spell_it_game/word_list_page.dart';
// // // import 'package:spell_it_game/settings_page.dart';

// // // class DashboardPage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return DefaultTabController(
// // //       length: 2,
// // //       child: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('Dashboard'),
// // //           actions: [
// // //             IconButton(
// // //               icon: Icon(Icons.settings),
// // //               onPressed: () {
// // //                 Navigator.push(
// // //                   context,
// // //                   MaterialPageRoute(builder: (context) => SettingsPage()),
// // //                 );
// // //               },
// // //             ),
// // //           ],
// // //           bottom: TabBar(
// // //             tabs: [
// // //               Tab(text: 'Words'),
// // //               Tab(text: 'Game'),
// // //             ],
// // //           ),
// // //         ),
// // //         body: TabBarView(
// // //           children: [
// // //             WordListPage(),
// // //             GamePage(),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:spell_it_game/game.dart';
// // import 'package:spell_it_game/game_provider.dart';
// // import 'package:spell_it_game/word_list_page.dart';

// // class DashboardPage extends StatefulWidget {
// //   @override
// //   _DashboardPageState createState() => _DashboardPageState();
// // }

// // class _DashboardPageState extends State<DashboardPage>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;
// //   late GameProvider _gameProvider;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _gameProvider = Provider.of<GameProvider>(context, listen: false);
// //     _tabController = TabController(length: 2, vsync: this);

// //     _tabController.addListener(() {
// //       if (!_tabController.indexIsChanging) {
// //         // Stop the timer, sound, and reset the game when changing tabs
// //         _gameProvider.stopTimer();
// //         _gameProvider.stopSpeak();
// //         _gameProvider.resetGame();
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Dashboard'),
// //         bottom: TabBar(
// //           controller: _tabController,
// //           tabs: [
// //             Tab(text: 'Word List'),
// //             Tab(text: 'Game'),
// //           ],
// //         ),
// //       ),
// //       body: TabBarView(
// //         controller: _tabController,
// //         children: [
// //           WordListPage(),
// //           GamePage(),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:spell_it_game/game.dart';
// import 'package:spell_it_game/game_provider.dart';

// class DashboardPage extends StatefulWidget {
//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late GameProvider _gameProvider;

//   @override
//   void initState() {
//     super.initState();
//     _gameProvider = Provider.of<GameProvider>(context, listen: false);
//     _tabController = TabController(length: 2, vsync: this);

//     _tabController.addListener(() {
//       if (!_tabController.indexIsChanging) {
//         _gameProvider.stopTimer();
//         _gameProvider.stopSpeak();
//         _gameProvider.resetGame();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Word List'),
//             Tab(text: 'Game'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           // WordListPage(),
//           GamePage(),
//         ],
//       ),
//     );
//   }
// }
