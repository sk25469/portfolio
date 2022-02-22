import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/constants/data.dart';
import 'package:portfolio/widgets/achievement_tile.dart';

const _kSize = 1536;

class AchievementComponent extends StatelessWidget {
  const AchievementComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme, width),
          Padding(
            padding: EdgeInsets.only(left: 30 / _kSize * width, top: 15 / _kSize * width),
            child: Row(
              children: [
                AchievementTile(achievement: AchievementsData.achievements[0]),
                SizedBox(width: 30 / _kSize * width),
                AchievementTile(achievement: AchievementsData.achievements[1]),
                SizedBox(width: 30 / _kSize * width),
                AchievementTile(achievement: AchievementsData.achievements[2]),
                SizedBox(width: 30 / _kSize * width),
                AchievementTile(achievement: AchievementsData.achievements[3]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme, double width) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 30.0 / _kSize * width,
      vertical: 0,
    ),
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
