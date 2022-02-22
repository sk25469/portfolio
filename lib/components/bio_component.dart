import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/social_media.dart';

const _kSize = 1536;

class BioComponent extends StatelessWidget {
  const BioComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTextTheme = Theme.of(context).textTheme;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;

    final theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      padding: EdgeInsets.only(top: 50 / _kSize * width),
      child: Stack(
        children: [
          Positioned(
            top: 10 / _kSize * width,
            left: 30 / _kSize * width,
            child: _welcomeText(currentTextTheme: currentTextTheme, width: width),
          ),
          Positioned(
            child: _bioTextBox(currentTextTheme: currentTextTheme, width: width),
            top: 120 / _kSize * width,
            left: 30 / _kSize * width,
          ),
          Positioned(
            child: _profileImage(isDark: _isDark, width: width),
            right: 20 / _kSize * width,
            bottom: 0,
          ),
          Positioned(
            child: SocialMediaContacts(
              width: width,
              hasResume: true,
              iconPadding: 15,
              iconSize: 60,
            ),
            bottom: 25 / _kSize * width,
            left: 30 / _kSize * width,
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _profileImage extends StatelessWidget {
  final bool isDark;
  final double width;
  const _profileImage({
    Key? key,
    required this.isDark,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isDark ? 'assets/images/sahil_dark.png' : 'assets/images/sahil_light.png',
      width: 500 / _kSize * width,
      height: 500 / _kSize * width,
    );
  }
}

// ignore: camel_case_types
class _bioTextBox extends StatelessWidget {
  final TextTheme currentTextTheme;
  final double width;
  const _bioTextBox({
    Key? key,
    required this.currentTextTheme,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 850 / _kSize * width,
      child: DefaultTextStyle(
        style: currentTextTheme.bodyText2!,
        child: AnimatedTextKit(
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          animatedTexts: [
            TypewriterAnimatedText(
                'An aspiring Full Stack Software Developer ${Emojis.technologist} having an experience in building Web and Mobile${Emojis.mobilePhone} applications with Flutter and Spring Boot.\nWhen I\'m not coding, I usually play video games ${Emojis.videoGame}, watch movies ${Emojis.filmFrames}, listen to music ${Emojis.musicalNotes}, or write ${Emojis.writingHand} something.'),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _welcomeText extends StatelessWidget {
  final TextTheme currentTextTheme;
  final double width;
  const _welcomeText({
    Key? key,
    required this.currentTextTheme,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultTextStyle(
          style: currentTextTheme.bodyText1!,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Hi, I\'m Sahil'),
            ],
          ),
        ),
        SizedBox(width: 10 / _kSize * width),
        Padding(
          padding: EdgeInsets.only(top: 3.0 / _kSize * width),
          child: Image.asset(
            'assets/images/hello_world.png',
            height: 75 / _kSize * width,
            width: 75 / _kSize * width,
          ),
        ),
      ],
    );
  }
}
