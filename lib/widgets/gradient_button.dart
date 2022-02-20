import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const GradientButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final double borderRadius = 10;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final _isDark = Theme.of(context).brightness == Brightness.dark;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: [
            _isDark ? Colors.grey : Colors.black,
            _isDark
                ? lightBackgroundColor.withOpacity(0.9)
                : darkBackgroundColor.withOpacity(0.9),
          ],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(
              right: 75,
              left: 75,
              top: 15,
              bottom: 15,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: _isDark ? Colors.black : Colors.white,
            fontSize: 20,
            fontFamily: 'ZenKakuGothicAntique-Regular',
          ),
        ),
      ),
    );
  }
}
