import 'package:flutter/material.dart';
import 'package:portfolio/widgets/divider.dart';
import 'package:portfolio/widgets/tech_detail.dart';

import '../../widgets/skill_animation.dart';

class SkillComponentMobile extends StatelessWidget {
  const SkillComponentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        // vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme, _isDark),
          const SizedBox(height: 16),
          const SizedBox(
            width: double.infinity,
            height: 300,
            child: SkillAnimation(),
          ),
          const SizedBox(height: 16),
          _detailText1(textTheme),
          const SizedBox(height: 16),
          const _techStacks(
            widthBetween: 20,
            heightBetween: 30,
            iconSize: 55,
          ),
          const SizedBox(height: 16),
          _detailText2(
            '⚡Develop highly interactive Front end/User interfaces for your web and mobile applications',
            textTheme,
          ),
          const SizedBox(height: 10),
          _detailText2(
            '⚡Building the backend along with integrating with third party APIs such as Firebase',
            textTheme,
          ),
          const SizedBox(height: 10),
          const DividerLine(),
        ],
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme, bool isDark) {
  return SelectableText(
    'What I do',
    style: TextStyle(
      color: isDark ? Colors.white : Colors.black,
      fontFamily: 'ZenKakuGothicAntique-Medium',
      fontSize: 50,
    ),
  );
}

Widget _detailText1(TextTheme currentTextTheme) {
  return SizedBox(
    width: double.infinity,
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
            const Spacer(),
            TechTile(
              techImage: Image.asset(
                'assets/icons/cpp.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'C++',
            ),
            const Spacer(),
            TechTile(
              techImage: Image.asset(
                'assets/icons/dart.png',
                width: iconSize,
                height: iconSize,
                fit: BoxFit.cover,
              ),
              techName: 'Dart',
            ),
            const Spacer(),
            TechTile(
              techImage: Image.asset(
                'assets/icons/database.png',
                width: iconSize,
                height: iconSize,
                fit: BoxFit.cover,
              ),
              techName: 'SQL',
            ),
            const Spacer(),
            TechTile(
              techImage: Image.asset(
                'assets/icons/docker.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Docker',
            ),
            // SizedBox(width: widthBetween),
            const Spacer(),
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
            // SizedBox(width: widthBetween),
            const Spacer(),
            TechTile(
              techImage: Image.asset(
                'assets/icons/java.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Java',
            ),
            // SizedBox(width: widthBetween),
            const Spacer(),
            TechTile(
              techImage: Image.asset(
                'assets/icons/linux.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Linux',
            ),
            // SizedBox(width: widthBetween),
            const Spacer(),
            TechTile(
              techImage: Image.asset(
                'assets/icons/mongodb.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'MongoDB',
            ),
            // SizedBox(width: widthBetween),
            const Spacer(),
            TechTile(
              techImage: Image.asset(
                'assets/icons/python.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Python',
            ),
            // SizedBox(width: widthBetween),
            const Spacer(),
            TechTile(
              techImage: Image.asset(
                'assets/icons/springBoot.png',
                width: iconSize,
                height: iconSize,
              ),
              techName: 'Spring Boot',
            ),
          ],
        )
      ],
    );
  }
}

Widget _detailText2(String text, TextTheme textTheme) {
  return SizedBox(
    width: 650,
    child: SelectableText(
      text,
      style: textTheme.subtitle1,
    ),
  );
}
