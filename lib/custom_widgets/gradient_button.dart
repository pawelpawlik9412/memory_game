import 'package:flutter/material.dart';
import 'package:memory_game/size_config.dart';

class GradientButton extends StatelessWidget {
  String label;
  TextEditingController userNameController;
  Function onPressed;

  GradientButton({@required this.label, @required this.onPressed, this.userNameController});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.tealAccent)),
      child: Text(
        label,
        style: TextStyle(
          fontSize: SizeConfig.textMultiplier * 3.5,
          fontFamily: 'Caveat',
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}