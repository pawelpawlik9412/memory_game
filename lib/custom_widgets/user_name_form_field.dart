import 'package:flutter/material.dart';
import 'package:memory_game/size_config.dart';

class UserNameFormField extends StatelessWidget {
  final TextEditingController userNameController;
  final hintText;

  UserNameFormField({
    @required this.userNameController,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: userNameController,
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter some text";
          }
          return null;
        },
        style: TextStyle(
          fontFamily: 'Caveat',
          fontSize: SizeConfig.textMultiplier * 3,
        ),
        decoration: InputDecoration(
          hintText: hintText == ''
              ? 'Your Name'
              : hintText,
          hintStyle: TextStyle(
            fontSize: SizeConfig.textMultiplier * 3,
            fontFamily: 'Caveat',
          ),
          focusColor: Colors.tealAccent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.tealAccent),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
