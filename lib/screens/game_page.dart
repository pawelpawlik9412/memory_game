import 'package:flutter/material.dart';
import 'package:memory_game/custom_widgets/memory_card.dart';
import 'package:memory_game/size_config.dart';

class GamePage extends StatelessWidget {
  List<MemoryCard> list = [
    MemoryCard(cardColor: Colors.tealAccent, cardIcon: Icons.create),
    MemoryCard(cardColor: Colors.tealAccent, cardIcon: Icons.create)
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 2.6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: _buildGameScreenTitle(),
            ),
            Expanded(
              flex: 10,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildScoreView(),
                    ),
                    Expanded(
                      flex: 10,
                      child: _buildGameCardsGridView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center _buildGameScreenTitle() {
    return Center(
      child: Hero(
        tag: 'title',
        child: Text(
          'Memory Game',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Caveat',
            color: Colors.tealAccent,
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.textMultiplier * 6.3,
          ),
        ),
      ),
    );
  }

  Row _buildScoreView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Level:',
          style: TextStyle(
            fontFamily: 'Caveat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
        Text(
          'Time: 00:00:00',
          style: TextStyle(
            fontFamily: 'Caveat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
      ],
    );
  }

  Container _buildGameCardsGridView() {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3.7),
      child: GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return list[index];
        },
      ),
    );
  }
}
