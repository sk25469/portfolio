import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/extensions/hovering_widget.dart';
import 'package:portfolio/widgets/resume_button.dart';

const _kSize = 1536;

class BioComponent extends StatelessWidget {
  const BioComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTextTheme = Theme.of(context).textTheme;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;

    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      padding: EdgeInsets.only(top: 50 / _kSize * width),
      child: Stack(
        children: [
          Positioned(
            top: 10 / _kSize * width,
            left: 30 / _kSize * width,
            child: _welcomeText(currentTextTheme, width),
          ),
          Positioned(
            child: _bioTextBox(currentTextTheme, width),
            top: 120 / _kSize * width,
            left: 30 / _kSize * width,
          ),
          Positioned(
            child: _profileImage(_isDark, width),
            right: 20 / _kSize * width,
            bottom: 0,
          ),
          Positioned(
            child: _socialMediaContacts(width),
            bottom: 25 / _kSize * width,
            left: 30 / _kSize * width,
          )
        ],
      ),
    );
  }
}

Widget _bioTextBox(TextTheme currentTextTheme, double width) {
  return SizedBox(
    width: 850 / _kSize * width,
    child: SelectableText(
      'An aspiring Full Stack Software Developer🧑‍💻 having an experience in building Web and Mobile📲 applications with Flutter and Spring Boot.\nWhen I\'m not coding, I\'m usually playing video games 🎮, watching movies 🎞️, listening to music 🎶, or writing something ✍️.',
      style: currentTextTheme.bodyText2,
    ),
  );
}

Widget _profileImage(bool isDark, double width) {
  return Image.asset(
    isDark ? 'assets/images/sahil_dark.png' : 'assets/images/sahil_light.png',
    width: 500 / _kSize * width,
    height: 500 / _kSize * width,
  );
}

Widget _welcomeText(TextTheme currentTextTheme, double width) {
  return Row(
    children: [
      SelectableText(
        'Hi, I\'m Sahil',
        style: currentTextTheme.bodyText1,
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

Widget _socialMediaContacts(double width) {
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
              width: 60 / _kSize * width,
              height: 60 / _kSize * width,
            ),
          ),
        ),
        SizedBox(width: 15 / _kSize * width),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/github.png',
              width: 60 / _kSize * width,
              height: 60 / _kSize * width,
            ),
          ),
        ),
        SizedBox(width: 15 / _kSize * width),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/linkedin.png',
              width: 60 / _kSize * width,
              height: 60 / _kSize * width,
            ),
          ),
        ),
        SizedBox(width: 15 / _kSize * width),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/twitter.png',
              width: 60 / _kSize * width,
              height: 60 / _kSize * width,
            ),
          ),
        ),
        SizedBox(width: 15 / _kSize * width),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/instagram.png',
              width: 60 / _kSize * width,
              height: 60 / _kSize * width,
            ),
          ),
        ),
        SizedBox(width: 15 / _kSize * width),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          child: TranslateOnHover(
            child: Image.asset(
              'assets/icons/facebook.png',
              width: 60 / _kSize * width,
              height: 60 / _kSize * width,
            ),
          ),
        ),
        SizedBox(width: 150 / _kSize * width),
        const ResumeButton(text: 'SEE MY RESUME'),
      ],
    ),
  );
}
