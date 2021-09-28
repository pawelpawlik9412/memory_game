import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/name_preferences_bloc.dart';
import 'package:memory_game/custom_widgets/gradient_button.dart';
import 'package:memory_game/custom_widgets/user_name_form_field.dart';
import 'package:memory_game/screens/home_page.dart';
import 'package:memory_game/size_config.dart';

class PageManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NamePreferencesBloc, NamePreferencesState>(
        builder: (context, state) {
          if (state is NamePreferencesEmpty) {
            return _buildUserNameForm(context);
          }
          if (state is NamePreferencesSetting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return HomePage();
          }
        },
      ),
    );
  }

  Container _buildUserNameForm(BuildContext context) {
    TextEditingController _userNameTextController = TextEditingController();
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 9.30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Set Player Name',
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 3.5,
              fontFamily: 'Caveat',
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          UserNameFormField(
            userNameController: _userNameTextController,
          ),
          SizedBox(
            height: 20.0,
          ),
          GradientButton(
            label: 'Submit',
            onPressed: () {
              BlocProvider.of<NamePreferencesBloc>(context).add(
                SetName(_userNameTextController.text),
              );
            },
          ),
        ],
      ),
    );
  }
}
