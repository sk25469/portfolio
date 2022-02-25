import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/social_media.dart';

const _kWidth = 1536;
const _kHeight = 745;

class BioComponent extends StatelessWidget {
  const BioComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTextTheme = Theme.of(context).textTheme;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;

    final theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      padding: EdgeInsets.only(top: 50 / _kHeight * height),
      child: Stack(
        children: [
          Positioned(
            top: 10 / _kHeight * height,
            left: 30 / _kWidth * width,
            child: welcomeText(
              currentTextTheme: currentTextTheme,
            ),
          ),
          Positioned(
            child: bioTextBox(
              currentTextTheme: currentTextTheme,
            ),
            top: 120 / _kHeight * height,
            left: 30 / _kWidth * width,
          ),
          Positioned(
            child: _profileImage(
              isDark: _isDark,
            ),
            right: 20 / _kWidth * width,
          ),
          Positioned(
            child: const SocialMediaContacts(
              hasResume: true,
              iconPadding: 15,
              iconSize: 60,
            ),
            bottom: 0 / _kHeight * height,
            left: 30 / _kWidth * width,
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _profileImage extends StatelessWidget {
  final bool isDark;
  const _profileImage({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Image.asset(
      isDark ? 'assets/images/sahil_dark.png' : 'assets/images/sahil_light.png',
      width: 500 / _kHeight * height,
      height: 500 / _kWidth * width,
    );
  }
}

// ignore: camel_case_types
class bioTextBox extends StatelessWidget {
  final TextTheme currentTextTheme;
  const bioTextBox({
    Key? key,
    required this.currentTextTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: 850 / _kWidth * width,
      height: 360 / _kHeight * height,
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
class welcomeText extends StatelessWidget {
  final TextTheme currentTextTheme;
  const welcomeText({
    Key? key,
    required this.currentTextTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
        SizedBox(width: 10 / _kWidth * width),
        Padding(
          padding: EdgeInsets.only(top: 3.0 / _kHeight * height),
          child: Image.asset(
            'assets/images/hello_world.png',
            height: 75 / _kHeight * height,
            width: 75 / _kWidth * width,
          ),
        ),
      ],
    );
  }
}
