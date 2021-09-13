import 'package:flutter/material.dart';
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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
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
                  rows: [],
                ),
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
}
