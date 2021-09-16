import 'package:flutter/material.dart';
import 'package:memory_game/constants/enums.dart';
import 'package:memory_game/size_config.dart';

class MemoryCard extends StatelessWidget {
  final String id;
  final Color cardColor;
  final IconData cardIcon;
  final CardState cardState;

  MemoryCard({@ required this.id, @required this.cardColor, @required this.cardIcon, @required this.cardState});

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
