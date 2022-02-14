import 'package:alvintestpartone/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ToggleTheme extends StatefulWidget {
  const ToggleTheme({Key? key}) : super(key: key);

  @override
  _ToggleThemeState createState() => _ToggleThemeState();
}

class _ToggleThemeState extends State<ToggleTheme> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: RaisedButton(
          color: context.theme.buttonColor,
          child: const Text(
            'Change Theme',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: ThemeService().switchTheme,
        ),
      );
    }
  }

