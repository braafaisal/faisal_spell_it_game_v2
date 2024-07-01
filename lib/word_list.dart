import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spell_it_game/game_provider.dart';
import 'package:spell_it_game/history_widget.dart';
// import 'package:spell_it_game/word_list_page.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // تعديل المحاذاة الأفقية
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // تعديل المحاذاة الأفقية داخل الصف
                  children: [
                    IconButton(
                      onPressed: () {
                        Provider.of<GameProvider>(context, listen: false)
                            .goToHome();
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      icon: Icon(
                        Icons.quiz,
                        color: Colors.amber,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Provider.of<GameProvider>(context, listen: false)
                        //     .goToHome();
                        Navigator.pushReplacementNamed(
                            context, '/wordListpage');
                      },
                      icon: Icon(
                        Icons.list,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // إضافة مسافة بين الصف والتاريخ
                Center(
                    child:
                        HistoryWidget()), // ضبط المحاذاة لعنصر HistoryWidget في المركز
              ],
            ),
          ),
        ),
      ),
    );
  }
}
