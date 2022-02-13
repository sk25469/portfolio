import 'package:flutter/material.dart';
import 'package:portfolio/extensions/hovering_widget.dart';

class BioComponent extends StatelessWidget {
  const BioComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTextTheme = Theme.of(context).textTheme;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;

    final theme = Theme.of(context);
    return Container(
      color: theme.accentColor,
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 30,
            child: _welcomeText(currentTextTheme),
          ),
          Positioned(
            child: _bioTextBox(currentTextTheme),
            top: 120,
            left: 30,
          ),
          Positioned(
            child: _profileImage(_isDark),
            right: 20,
            bottom: 0,
          ),
          Positioned(
            child: _socialMediaContacts(),
            bottom: 25,
            left: 30,
          )
        ],
      ),
    );
  }
}

Widget _bioTextBox(TextTheme currentTextTheme) {
  return SizedBox(
    width: 850,
    child: SelectableText(
      'An aspiring Full Stack Software Developer🧑‍💻 having an experience in building Web and Mobile📲 applications with Flutter and Spring Boot.\nWhen I\'m not coding, I\'m usually playing video games 🎮, watching movies 🎞️, listening to music 🎶, or writing something ✍️.',
      style: currentTextTheme.bodyText2,
    ),
  );
}

Widget _profileImage(bool isDark) {
  return Image.asset(
    isDark ? 'assets/images/sahil_dark.png' : 'assets/images/sahil_light.png',
    width: 500,
    height: 500,
  );
}

Widget _welcomeText(TextTheme currentTextTheme) {
  return Row(
    children: [
      SelectableText(
        'Hi, I\'m Sahil',
        style: currentTextTheme.bodyText1,
      ),
      const SizedBox(width: 10),
      Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Image.asset(
          'assets/images/hello_world.png',
          height: 75,
          width: 75,
        ),
      ),
    ],
  );
}

Widget _socialMediaContacts() {
  return Material(
    color: Colors.transparent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {},
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/email.png',
              width: 60,
              height: 60,
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {},
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/github.png',
              width: 60,
              height: 60,
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {},
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/linkedin.png',
              width: 60,
              height: 60,
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {},
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/twitter.png',
              width: 60,
              height: 60,
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {},
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/instagram.png',
              width: 60,
              height: 60,
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {},
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/facebook.png',
              width: 60,
              height: 60,
            ),
          ),
        ),
      ],
    ),
  );
}
