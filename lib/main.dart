import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spell_it_game/game.dart';
import 'package:spell_it_game/game_provider.dart';
// import 'package:spell_it_game/history_widget.dart';
// import 'package:spell_it_game/dashboard_page.dart';
import 'package:spell_it_game/results.dart';
import 'package:spell_it_game/word_list.dart';

import 'word_list_page.dart';
// import 'package:spell_it_game/word_list_page.dart';
// import 'package:spell_it_game/timer_provider.dart';
// import 'package:spell_it_game/word_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
        // ChangeNotifierProvider(create: (_) => TimerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spell It Game',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => GamePage(),
          '/historyList': (context) => const HistoryList(),
         '/wordListpage': (context) => WordListPage(),
          '/results': (context) => ResultsPage(),
        },
      ),
    );
  }
}
