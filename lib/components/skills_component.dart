import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/skill_animation.dart';
import 'package:portfolio/widgets/tech_detail.dart';

const _kSize = 1536;

class SkillComponent extends StatelessWidget {
  const SkillComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final currentTextTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      child: Stack(
        children: [
          Positioned(
            child: const SkillAnimation(),
            top: 30 / _kSize * width,
            left: 40 / _kSize * width,
            width: 550 / _kSize * width,
            height: 550 / _kSize * width,
          ),
          Positioned(
            left: 800 / _kSize * width,
            top: 10 / _kSize * width,
            child: _welcomeText(currentTextTheme),
          ),
          Positioned(
            left: 800 / _kSize * width,
            top: 100 / _kSize * width,
            child: _detailText1(currentTextTheme, width),
          ),
          Positioned(
            child: _techStacks(
              widthBetween: 30 / _kSize * width,
              heightBetween: 20 / _kSize * width,
              width: width,
              iconSize: 70,
            ),
            left: 800 / _kSize * width,
            top: 190 / _kSize * width,
            width: 900 / _kSize * width,
          ),
          Positioned(
            child: _detailText2(
              '⚡Develop highly interactive Front end/User interfaces for your web and mobile applications',
              currentTextTheme,
              width,
            ),
            left: 800 / _kSize * width,
            top: 425 / _kSize * width,
          ),
          Positioned(
            child: _detailText2(
              '⚡Building the backend along with integrating with third party APIs such as Firebase',
              currentTextTheme,
              width,
            ),
            left: 800 / _kSize * width,
            top: 500 / _kSize * width,
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme) {
  return SelectableText(
    'What I do',
    style: currentTextTheme.bodyText1,
  );
}

Widget _detailText1(TextTheme currentTextTheme, double width) {
  return SizedBox(
    width: 650 / _kSize * width,
    child: SelectableText(
      'PASSIONATE FULL STACK DEVELOPER WHO WANTS TO EXPLORE EVERY TECH STACK AND LEARN NEW THINGS',
      style: currentTextTheme.subtitle1,
    ),
  );
}

// ignore: camel_case_types
class _techStacks extends StatelessWidget {
  final double widthBetween, heightBetween, width, iconSize;
  const _techStacks({
    Key? key,
    required this.widthBetween,
    required this.heightBetween,
    required this.width,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TechTile(
              techImage: Image.asset(
                'assets/icons/android.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
              techName: 'Android',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/cpp.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
              techName: 'C++',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/dart.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
                fit: BoxFit.cover,
              ),
              techName: 'Dart',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/database.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
                fit: BoxFit.cover,
              ),
              techName: 'SQL',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/docker.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
              techName: 'Docker',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/firebase.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
              techName: 'Firebase',
            ),
          ],
        ),
        SizedBox(height: heightBetween),
        Row(
          children: [
            TechTile(
              techImage: Image.asset(
                'assets/icons/flutter.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
              techName: 'Flutter',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/java.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
              techName: 'Java',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/linux.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
              techName: 'Linux',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/mongodb.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
              techName: 'MongoDB',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/python.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
              techName: 'Python',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/springBoot.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
              techName: 'Spring Boot',
            ),
          ],
        )
      ],
    );
  }
}

Widget _detailText2(String text, TextTheme textTheme, double width) {
  return SizedBox(
    width: 650 / _kSize * width,
    child: SelectableText(
      text,
      style: textTheme.subtitle1,
    ),
  );
}
