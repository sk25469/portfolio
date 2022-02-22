import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';

// const _kWidth = 1536;
// const _kHeight = 745;

class GradientButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isCertificate;

  const GradientButton({
    required this.text,
    required this.onPressed,
    Key? key,
    required this.isCertificate,
  }) : super(key: key);

  final double borderRadius = 10;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
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
            EdgeInsets.only(
              right: !isCertificate ? 60 : 10,
              left: !isCertificate ? 60 : 10,
              top: !isCertificate ? 15 : 8,
              bottom: !isCertificate ? 15 : 10,
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
            color: Colors.white,
            fontSize: !isCertificate ? 20 : 15,
            fontFamily: 'ZenKakuGothicAntique-Regular',
          ),
        ),
      ),
    );
  }
}
