import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const AppBarButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: MaterialButton(
        height: 55,
        hoverColor: themeData.accentColor,
        onPressed: onPressed(),
        child: Text(
          text,
          style: themeData.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
