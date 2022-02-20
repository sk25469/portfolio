import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 15;
    // bool _isDark = Theme.of(context).brightness == Brightness.dark;

    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: lightPurple,
        gradient: const LinearGradient(
          colors: [
            darkPurple,
            lightPurple,
          ],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(
              right: 30,
              left: 30,
              top: 15,
              bottom: 19,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: theme.textTheme.button?.copyWith(
            // color: _isDark ? Colors.black : Colors.white,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
