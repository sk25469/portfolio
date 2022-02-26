import 'package:flutter/material.dart';
import 'package:portfolio/constants/data.dart';
import 'package:portfolio/widgets/achievement_tile.dart';

class AchivementComponentMobile extends StatelessWidget {
  const AchivementComponentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // double width = MediaQuery.of(context).size.width;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme, _isDark),
          const SizedBox(height: 16),
          Center(
            child: AchievementTile(achievement: AchievementsData.achievements[0]),
          ),
          const SizedBox(height: 16),
          Center(
            child: AchievementTile(achievement: AchievementsData.achievements[1]),
          ),
          const SizedBox(height: 16),
          Center(
            child: AchievementTile(achievement: AchievementsData.achievements[2]),
          ),
          const SizedBox(height: 16),
          Center(
            child: AchievementTile(achievement: AchievementsData.achievements[3]),
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme, bool isDark) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SelectableText(
        'Achievements and Certifications 🏆',
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontFamily: 'ZenKakuGothicAntique-Medium',
          fontSize: 50,
        ),
      ),
      SelectableText(
        'ACHIEVEMENTS, CERTIFICATIONS, AWARD LETTERS AND SOME COOL STUFF THAT I HAVE DONE!',
        style: currentTextTheme.subtitle1,
      )
    ],
  );
}
