import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/hovering_animation.dart';

const _kWidth = 1536;
const _kHeight = 745;
const String bioText =
    'I am a third year undergraduate from National Institute of Technology Silchar' +
        Emojis.classicalBuilding +
        '. I started coding ' +
        Emojis.technologist +
        'from my second year and got into the world of Android Development. I joined the Google\'s Developers Student Club of my college and worked on an Android App called Easy Exchange for buying and selling of used items in my campus.\nI did native Android in Java for about a year. While doing so, I got to know about Flutter and it\'s potential for the future, and started learning Flutter from the summer of 2021. I made several projects using Flutter for mobile and have been enjoying my journey as a Flutter Developer since then.\nNow a days I am working on backend development with Go and I am still learning it and building several projects with it. Apart from that, I am working on building web and desktop applications using Flutter.\nI would love to hear from you on collaboration' +
        Emojis.thumbsUp +
        ' or any ideas' +
        Emojis.thinkingFace +
        '.' +
        ' Hit me up! ${Emojis.wavingHand}';

class KnowMeComponent extends StatelessWidget {
  const KnowMeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final currentTextTheme = Theme.of(context).textTheme;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      child: Stack(
        children: [
          Positioned(
            left: 30 / _kWidth * width,
            child: _welcomeText(currentTextTheme),
          ),
          Positioned(
            right: 10 / _kWidth * width,
            top: 20 / _kHeight * height,
            child: const HoveringAnimation(),
            width: 500 / _kWidth * width,
            height: 500 / _kHeight * height,
          ),
          Positioned(
            child: _bioText(
              textTheme: currentTextTheme,
              text: bioText,
            ),
            left: 30 / _kWidth * width,
            top: 90 / _kHeight * height,
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme) {
  return SelectableText(
    'Who I am',
    style: currentTextTheme.bodyText1,
  );
}

// ignore: camel_case_types
class _bioText extends StatelessWidget {
  final TextTheme textTheme;
  final String text;
  const _bioText({
    Key? key,
    required this.textTheme,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 900 / _kWidth * width,
      child: SelectableText(
        text,
        style: textTheme.subtitle2,
      ),
    );
  }
}
