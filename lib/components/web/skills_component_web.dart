import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/skill_animation.dart';
import 'package:portfolio/widgets/tech_detail.dart';

const _kWidth = 1536;
const _kHeight = 745;

class SkillComponent extends StatelessWidget {
  const SkillComponent({Key? key}) : super(key: key);

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
            child: const SkillAnimation(),
            top: 30 / _kHeight * height,
            left: 40 / _kWidth * width,
            width: 550 / _kWidth * width,
            height: 550 / _kHeight * height,
          ),
          Positioned(
            left: 800 / _kWidth * width,
            top: 10 / _kHeight * height,
            child: _welcomeText(currentTextTheme),
          ),
          Positioned(
            left: 800 / _kWidth * width,
            top: 100 / _kHeight * height,
            child: _detailText1(currentTextTheme, width),
          ),
          Positioned(
            child: _techStacks(
              widthBetween: 30 / _kWidth * width,
              heightBetween: 20 / _kHeight * height,
              iconSize: 70,
            ),
            left: 800 / _kWidth * width,
            top: 190 / _kHeight * height,
            width: 900 / _kWidth * width,
          ),
          Positioned(
            child: _detailText2(
              '⚡Develop highly interactive Front end/User interfaces for your web and mobile applications',
              currentTextTheme,
              width,
            ),
            left: 800 / _kWidth * width,
            top: 425 / _kHeight * height,
          ),
          Positioned(
            child: _detailText2(
              '⚡Building the backend along with integrating with third party APIs such as Firebase',
              currentTextTheme,
              width,
            ),
            left: 800 / _kWidth * width,
            top: 500 / _kHeight * height,
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
    width: 650 / _kWidth * width,
    child: SelectableText(
      'PASSIONATE FULL STACK DEVELOPER WHO WANTS TO EXPLORE EVERY TECH STACK AND LEARN NEW THINGS',
      style: currentTextTheme.subtitle1,
    ),
  );
}

// ignore: camel_case_types
class _techStacks extends StatelessWidget {
  final double widthBetween, heightBetween, iconSize;
  const _techStacks({
    Key? key,
    required this.widthBetween,
    required this.heightBetween,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            TechTile(
              techImage: Image.asset(
                'assets/icons/android.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Android',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/cpp.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'C++',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/dart.png',
                width: iconSize,
                height: iconSize,
                fit: BoxFit.cover,
              ),
              techName: 'Dart',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/database.png',
                width: iconSize,
                height: iconSize,
                fit: BoxFit.cover,
              ),
              techName: 'SQL',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/docker.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Docker',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/firebase.png',
                width: iconSize,
                height: iconSize,
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
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Flutter',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/java.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Java',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/linux.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Linux',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/mongodb.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'MongoDB',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/python.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Python',
            ),
            SizedBox(width: widthBetween),
            TechTile(
              techImage: Image.asset(
                'assets/icons/golang.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Go',
            ),
          ],
        )
      ],
    );
  }
}

Widget _detailText2(String text, TextTheme textTheme, double width) {
  return SizedBox(
    width: 650 / _kWidth * width,
    child: SelectableText(
      text,
      style: textTheme.subtitle1,
    ),
  );
}
