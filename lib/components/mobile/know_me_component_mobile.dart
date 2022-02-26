import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/hovering_animation.dart';

const String bioText =
    'I am a third year undergraduate from National Institute of Technology Silchar' +
        Emojis.classicalBuilding +
        '. I started coding ' +
        Emojis.technologist +
        'from my second year and got into the world of Android Development. I joined the Google\'s Developers Student Club of my college and worked on an Android App called Easy Exchange for buying and selling of used items in my campus.\nI did native Android in Java for about a year. While doing so, I got to know about Flutter and it\'s potential for the future, and started learning Flutter from the summer of 2021. I made several projects using Flutter for mobile and have been enjoying my journey as a Flutter Developer since then.\nAs I already had experience in Java, I started working on backend development using Spring Boot and I am still learning it. Apart from that, I am working on building web and desktop applications using Flutter.\nI would love to hear from you on collaboration' +
        Emojis.thumbsUp +
        ' or any ideas' +
        Emojis.thinkingFace +
        '.' +
        ' Hit me up! ${Emojis.wavingHand}';

class KnowMeComponentMobile extends StatelessWidget {
  const KnowMeComponentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme),
          const SizedBox(height: 20),
          const SizedBox(
            width: double.infinity,
            height: 300,
            child: HoveringAnimation(),
          ),
          const SizedBox(height: 20),
          _bioText(
            textTheme: textTheme,
            text: bioText,
          )
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
    // double width = MediaQuery.of(context).size.width;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: double.infinity,
      child: SelectableText(
        text,
        style: TextStyle(
          color: _isDark ? Colors.white : Colors.black,
          fontSize: 20,
          fontFamily: 'ZenKakuGothicAntique-Regular',
        ),
      ),
    );
  }
}
