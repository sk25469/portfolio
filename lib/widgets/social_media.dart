import 'package:flutter/material.dart';
import 'package:portfolio/extensions/hovering_widget.dart';
import 'package:portfolio/widgets/custom_button.dart';

const _kSize = 1536;

class SocialMediaContacts extends StatelessWidget {
  final double width;
  final bool hasResume;
  final double iconSize;
  final double iconPadding;
  const SocialMediaContacts({
    Key? key,
    required this.width,
    required this.hasResume,
    required this.iconSize,
    required this.iconPadding,
  }) : super(key: key);

  // initial - iconSize = 60, padding = 15

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/email.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          SizedBox(width: iconPadding / _kSize * width),
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/github.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          SizedBox(width: iconPadding / _kSize * width),
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/linkedin.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          SizedBox(width: iconPadding / _kSize * width),
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/twitter.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          SizedBox(width: iconPadding / _kSize * width),
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/instagram.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          SizedBox(width: iconPadding / _kSize * width),
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/facebook.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          if (hasResume) SizedBox(width: 150 / _kSize * width),
          if (hasResume) const CustomButton(text: 'SEE MY RESUME'),
        ],
      ),
    );
  }
}
