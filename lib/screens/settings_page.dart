import 'package:flutter/material.dart';
import 'package:memory_game/size_config.dart';
import 'package:memory_game/custom_widgets/gradient_button.dart';
import 'package:memory_game/custom_widgets/user_name_form_field.dart';

class SettingsPage extends StatelessWidget {

  final TextEditingController _userNameController = TextEditingController();

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
              flex: 2,
              child: _buildSettingsPageTitle(),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 5),
                child: Column(
                  children: [
                    PlayerSettingsSegment(userNameController: _userNameController),
                    SizedBox(height: SizeConfig.textMultiplier * 2,),
                    GameSettingsSegment(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildSettingsPageTitle() {
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
              'Settings',
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

class GameSettingsSegment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Game settings',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 3,
            fontFamily: 'Caveat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Divider(
          thickness: 1.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reset your scoreboard',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 3,
                fontFamily: 'Caveat',
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            GradientButton(label: 'Reset', onPressed: () {
              },
            )
          ],
        ),
      ],
    );
  }
}

class PlayerSettingsSegment extends StatelessWidget {

  final TextEditingController userNameController;

  PlayerSettingsSegment({@required  this.userNameController,});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Player settings',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 3,
            fontFamily: 'Caveat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Divider(
          thickness: 1.0,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserNameFormField(
              userNameController: userNameController,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.5,
            ),
            GradientButton(
              label: 'Change',
              onPressed: () {
              },
            ),
          ],
        ),
      ],
    );
  }
}



