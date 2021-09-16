import 'package:flutter/material.dart';
import 'package:memory_game/size_config.dart';

class UserNameFormField extends StatelessWidget {
  final TextEditingController userNameController;

  UserNameFormField({
    @required this.userNameController,
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
          fontSize: SizeConfig.textMultiplier * 2,
        ),
        decoration: InputDecoration(
          hintText: userNameController.text,
          hintStyle: TextStyle(fontSize: SizeConfig.textMultiplier * 2),
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