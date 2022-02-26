import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';

class BioComponentMobile extends StatelessWidget {
  const BioComponentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      // height: 1000,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          welcomeText(currentTextTheme: textTheme),
          const SizedBox(height: 10),
          bioTextBox(currentTextTheme: textTheme),
          // const SizedBox(height: 10),
          const _profileImage(),
          const SizedBox(height: 10),
          Center(
            child: Divider(
              height: 15,
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: _isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _profileImage extends StatelessWidget {
  const _profileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Image.asset(
      isDark ? 'assets/images/sahil_dark.png' : 'assets/images/sahil_light.png',
      width: 400,
      height: 400,
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
      width: double.infinity,
      height: 0.8 * height,
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
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          DefaultTextStyle(
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontFamily: 'ZenKakuGothicAntique-Medium',
              fontSize: 50,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Hi, I\'m Sahil'),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              top: 3.0,
              right: 10,
            ),
            child: Image.asset(
              'assets/images/hello_world.png',
              height: 55,
              width: 55,
            ),
          ),
        ],
      ),
    );
  }
}
