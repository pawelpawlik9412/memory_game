import 'package:flutter/material.dart';
import 'package:memory_game/size_config.dart';

class MemoryCard extends StatelessWidget {
  Color cardColor;
  IconData cardIcon;

  MemoryCard({@required this.cardColor, @required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthMultiplier),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.heightMultiplier),
            color: cardColor,
          ),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Container(
              padding: EdgeInsets.all(SizeConfig.widthMultiplier * 1.5),
              child: Icon(cardIcon),
            ),
          ),
        ),
      ),
    );
  }
}
