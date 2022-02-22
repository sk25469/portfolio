import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/constants/data.dart';
import 'package:portfolio/widgets/achievement_tile.dart';

const _kWidth = 1536;
const _kHeight = 745;

class AchievementComponent extends StatelessWidget {
  const AchievementComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme, width),
          FittedBox(
            child: Padding(
              padding: EdgeInsets.only(
                left: 30 / _kWidth * width,
                top: 15 / _kHeight * height,
              ),
              child: Row(
                children: [
                  AchievementTile(achievement: AchievementsData.achievements[0]),
                  SizedBox(width: 30 / _kWidth * width),
                  AchievementTile(achievement: AchievementsData.achievements[1]),
                  SizedBox(width: 30 / _kWidth * width),
                  AchievementTile(achievement: AchievementsData.achievements[2]),
                  SizedBox(width: 30 / _kWidth * width),
                  AchievementTile(achievement: AchievementsData.achievements[3]),
                  SizedBox(width: 30 / _kWidth * width),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme, double width) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.0 / _kWidth * width),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          'Achievements and Certifications 🏆',
          style: currentTextTheme.bodyText1,
        ),
        SelectableText(
          'ACHIEVEMENTS, CERTIFICATIONS, AWARD LETTERS AND SOME COOL STUFF THAT I HAVE DONE!',
          style: currentTextTheme.subtitle1,
        )
      ],
    ),
  );
}
