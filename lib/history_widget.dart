// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:spell_it_game/game_provider.dart';

// class HistoryWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<GameProvider>(
//       builder: (context, gameProvider, child) {
//         return DataTable(
//           columns: [
//             DataColumn(label: Text('Word')),
//             DataColumn(label: Text('Actions')),
//           ],
//           rows: List<DataRow>.generate(
//             gameProvider.currentWordIndex,
//             (index) {
//               String word = gameProvider.words[index];
//               return DataRow(cells: [
//                 DataCell(Text(word)),
//                 DataCell(
//                   IconButton(
//                     icon: Icon(Icons.volume_up),
//                     onPressed: () {
//                       gameProvider.speakWord(word);
//                     },
//                   ),
//                 ),
//               ]);
//             },
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spell_it_game/game_provider.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTable(
              decoration: BoxDecoration(color: Colors.amber.shade50),
              sortAscending: true,
              columnSpacing: 1.0,
              dataRowMaxHeight: double.infinity,
              dataRowMinHeight: 60.0,
              dividerThickness: 1,
              border: TableBorder.all(color: Colors.grey.shade100, width: 2),
              columns: [
                DataColumn(
                  label: Text(
                    'Word',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                DataColumn(
                    label: Text(
                  'Actions',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
              ],
              rows: List<DataRow>.generate(
                gameProvider.currentWordIndex,
                (index) {
                  String word = gameProvider.words[index];
                  bool isCorrect = gameProvider.wordStatuses[index];
                  return DataRow(cells: [
                    DataCell(
                      Text(
                        word,
                        style: TextStyle(
                            color: isCorrect ? Colors.green : Colors.red,
                            fontSize: 25),
                      ),
                    ),
                    DataCell(
                      isCorrect
                          ? Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.volume_up,
                                  color: Colors.green,
                                ),
                                onPressed: () {
                                  gameProvider.speakWord(word);
                                },
                              ),
                            )
                          : Center(
                              child: Icon(
                                Icons.volume_off,
                                color: Colors.red,
                              ),
                            ),
                    ),
                  ]);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
