import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/tech_detail.dart';
import 'package:rive/rive.dart';

class SkillComponent extends StatefulWidget {
  const SkillComponent({Key? key}) : super(key: key);

  @override
  State<SkillComponent> createState() => _SkillComponentState();
}

class _SkillComponentState extends State<SkillComponent> {
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'Appearing',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
    // _controller.isActive = true;
  }

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final currentTextTheme = Theme.of(context).textTheme;

    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      child: Stack(
        children: [
          Positioned(
            child: RiveAnimation.asset(
              'assets/animation/upload-animation.riv',
              animations: const ['Appearing'],
              controllers: [_controller],
            ),
            top: 30,
            left: 40,
            width: 550,
            height: 550,
          ),
          Positioned(
            left: 800,
            top: 10,
            child: _welcomeText(currentTextTheme),
          ),
          Positioned(
            left: 800,
            top: 100,
            child: _detailText1(currentTextTheme),
          ),
          Positioned(
            child: _techStacks(30, 20),
            left: 800,
            top: 190,
            width: 900,
          ),
          Positioned(
            child: _detailText2(
              '⚡Develop highly interactive Front end/User interfaces for your web and mobile applications',
              currentTextTheme,
            ),
            left: 800,
            top: 425,
          ),
          Positioned(
            child: _detailText2(
              '⚡Building the backend along with integrating with third party APIs such as Firebase',
              currentTextTheme,
            ),
            left: 800,
            top: 500,
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

Widget _detailText1(TextTheme currentTextTheme) {
  return SizedBox(
    width: 650,
    child: SelectableText(
      'PASSIONATE FULL STACK DEVELOPER WHO WANTS TO EXPLORE EVERY TECH STACK AND LEARN NEW THINGS',
      style: currentTextTheme.subtitle1,
    ),
  );
}

Widget _techStacks(double widthBetween, double heightBetween) {
  return Column(
    children: [
      Row(
        children: [
          TechTile(
            techImage: Image.asset(
              'assets/icons/android.png',
              width: 70,
              height: 70,
            ),
            techName: 'Android',
          ),
          SizedBox(width: widthBetween),
          TechTile(
            techImage: Image.asset(
              'assets/icons/cpp.png',
              width: 70,
              height: 70,
            ),
            techName: 'C++',
          ),
          SizedBox(width: widthBetween),
          TechTile(
            techImage: Image.asset(
              'assets/icons/dart.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            techName: 'Dart',
          ),
          SizedBox(width: widthBetween),
          TechTile(
            techImage: Image.asset(
              'assets/icons/database.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            techName: 'SQL',
          ),
          SizedBox(width: widthBetween),
          TechTile(
            techImage: Image.asset(
              'assets/icons/docker.png',
              width: 70,
              height: 70,
            ),
            techName: 'Docker',
          ),
          SizedBox(width: widthBetween),
          TechTile(
            techImage: Image.asset(
              'assets/icons/firebase.png',
              width: 70,
              height: 70,
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
              width: 70,
              height: 70,
            ),
            techName: 'Flutter',
          ),
          SizedBox(width: widthBetween),
          TechTile(
            techImage: Image.asset(
              'assets/icons/java.png',
              width: 70,
              height: 70,
            ),
            techName: 'Java',
          ),
          SizedBox(width: widthBetween),
          TechTile(
            techImage: Image.asset(
              'assets/icons/linux.png',
              width: 70,
              height: 70,
            ),
            techName: 'Linux',
          ),
          SizedBox(width: widthBetween),
          TechTile(
            techImage: Image.asset(
              'assets/icons/mongodb.png',
              width: 70,
              height: 70,
            ),
            techName: 'MongoDB',
          ),
          SizedBox(width: widthBetween),
          TechTile(
            techImage: Image.asset(
              'assets/icons/python.png',
              width: 70,
              height: 70,
            ),
            techName: 'Python',
          ),
          SizedBox(width: widthBetween),
          TechTile(
            techImage: Image.asset(
              'assets/icons/springBoot.png',
              width: 70,
              height: 70,
            ),
            techName: 'Spring Boot',
          ),
        ],
      )
    ],
  );
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
