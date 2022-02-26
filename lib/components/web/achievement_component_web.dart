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
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme, width),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 15,
            ),
            child: Row(
              children: [
                AchievementTile(achievement: AchievementsData.achievements[0]),
                const SizedBox(width: 30),
                AchievementTile(achievement: AchievementsData.achievements[1]),
                const SizedBox(width: 30),
                AchievementTile(achievement: AchievementsData.achievements[2]),
                const SizedBox(width: 30),
                AchievementTile(achievement: AchievementsData.achievements[3]),
                const SizedBox(width: 30),
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
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
