import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/memories_set_bloc.dart';
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
        onTap: () {
          if(cardState == CardState.Hidden) {
            BlocProvider.of<MemoriesSetBloc>(context).add(ChosseMemoryFromSet(id));
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.heightMultiplier),
            color: _getCardColor(),
          ),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Container(
              padding: EdgeInsets.all(SizeConfig.widthMultiplier * 1.5),
              child: Icon(_getCardIcon()),
            ),
          ),
        ),
      ),
    );
  }

  Color _getCardColor() {
    if(cardState == CardState.Hidden) {
      return Colors.tealAccent;
    }
    else {
      return cardColor;
    }
  }

  IconData _getCardIcon() {
    if(cardState == CardState.Hidden) {
      return null;
    }
    else {
      return cardIcon;
    }
  }
}
