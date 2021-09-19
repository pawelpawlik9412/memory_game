import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/memories_set_bloc.dart';
import 'package:memory_game/bloc/stopwatch_bloc.dart';
import 'package:memory_game/constants/enums.dart';
import 'package:memory_game/size_config.dart';

class MemoryCard extends StatelessWidget {
  final String id;
  final Color cardColor;
  final IconData cardIcon;
  final CardState cardState;

  MemoryCard(
      {@required this.id,
      @required this.cardColor,
      @required this.cardIcon,
      @required this.cardState});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.widthMultiplier),
      child: GestureDetector(
        onTap: () {
          if (cardState == CardState.Hidden) {
            BlocProvider.of<MemoriesSetBloc>(context)
                .add(ChosseMemoryFromSet(id));
            BlocProvider.of<StopwatchBloc>(context).add(StartedStopwatch());
          }
        },
        child: cardState == CardState.Guessed ? _guessedCard() : _notGuessedCard(),
      ),
    );
  }

  _notGuessedCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: _getCardColor(),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Icon(
          _getCardIcon(),
        ),
      ),
    );
  }

  _guessedCard() {
    return TweenAnimationBuilder(
      tween: ColorTween(begin: cardColor, end: Colors.grey.withOpacity(0.5)),
      duration: Duration(milliseconds: 300),
      builder: (_, Color color, __) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Icon(
              _getCardIcon(),
            ),
          ),
        );
      },
    );
  }

  Color _getCardColor() {
    if (cardState == CardState.Hidden) {
      return Colors.tealAccent;
    } else {
      return cardColor;
    }
  }

  IconData _getCardIcon() {
    if (cardState == CardState.Hidden) {
      return null;
    } else {
      return cardIcon;
    }
  }
}
