import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/score_bloc.dart';
import 'package:memory_game/model/score.dart';
import 'package:memory_game/size_config.dart';

class ScorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: _buildScorePageTitle(),
            ),
            Expanded(
              flex: 7,
              child: BlocBuilder<ScoreBloc, ScoreState>(
                builder: (context, state) {
                  print(state);
                  if (state is ScoresLoaded) {
                    List<Score> listScores = state.listScores;
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 5),
                      child: DataTable(
                        dividerThickness: 0.0,
                        columns: [
                          DataColumn(
                            label: Text(
                              'Place',
                              style: TextStyle(
                                fontFamily: 'Caveat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.textMultiplier * 3.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Name',
                              style: TextStyle(
                                fontFamily: 'Caveat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.textMultiplier * 3.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Time',
                              style: TextStyle(
                                fontFamily: 'Caveat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.textMultiplier * 3.0,
                              ),
                            ),
                          ),
                        ],
                        rows: _buildListDataRow(listScores),
                      ),
                    );
                  } else if (state is ScoresLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildScorePageTitle() {
    return Container(
      padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2.1),
      child: Center(
        child: Column(
          children: [
            Hero(
              tag: 'title',
              child: Text(
                'Memory Game',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Caveat',
                  color: Colors.tealAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.textMultiplier * 5,
                ),
              ),
            ),
            Text(
              'Scoreboard',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Caveat',
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.textMultiplier * 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataRow> _buildListDataRow(List<Score> listScore) {
    List<DataRow> listOfRow = [];
    for (var x = 0; x < listScore.length; x++) {
      listOfRow.add(
        DataRow(
          cells: [
            DataCell(
              Text(
                (x + 1).toString(),
                style: TextStyle(
                  fontFamily: 'Caveat',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.textMultiplier * 2.5,
                ),
              ),
            ),
            DataCell(
              Text(
                listScore[x].playerName,
                style: TextStyle(
                  fontFamily: 'Caveat',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.textMultiplier * 2.5,
                ),
              ),
            ),
            DataCell(
              Text(
                listScore[x].timeMinutesFormat,
                style: TextStyle(
                  fontFamily: 'Caveat',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.textMultiplier * 2.5,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return listOfRow;
  }
}
