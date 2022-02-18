import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/model/achievement_model.dart';

class AchievementTile extends StatelessWidget {
  final Achievement achievement;
  const AchievementTile({
    Key? key,
    required this.achievement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    double containerWidth = 300, containerHeight = 450;

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: _isDark ? darkBackgroundColor : lightBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:
                _isDark ? Colors.white.withOpacity(0.3) : Colors.black.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: containerWidth,
              height: containerHeight / 2,
              alignment: Alignment.topCenter,
              child: Image.asset(
                achievement.assetName,
                width: containerWidth,
                height: containerHeight / 2,
              ),
            ),
            top: containerHeight / 32,
            left: containerWidth / 64 - 5,
          ),
          Positioned(
            child: const Text(
              '2021',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'ZenKakuGothicAntique-Medium',
                fontSize: 60,
              ),
            ),
            top: containerHeight / 8 + 13,
            left: containerWidth / 2 - 50,
          ),
          Positioned(
            child: Container(
              width: containerWidth,
              height: containerHeight / 2,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _buildAchievementDescription(
                  achievement: achievement,
                  textTheme: textTheme,
                ),
              ),
            ),
            top: 0.6 * containerHeight,
            left: 10,
          ),
          Positioned(
            child: CertificateButton(
              textTheme: textTheme,
              isDark: _isDark,
            ),
            bottom: 0.05 * containerHeight,
            left: containerWidth / 2 - 90,
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _buildAchievementDescription extends StatelessWidget {
  final Achievement achievement;
  final TextTheme textTheme;
  const _buildAchievementDescription({
    Key? key,
    required this.achievement,
    required this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      achievement.description,
      style: textTheme.headline4,
    );
  }
}

class CertificateButton extends StatelessWidget {
  final TextTheme textTheme;
  final bool isDark;
  const CertificateButton({
    Key? key,
    required this.textTheme,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 200,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'View Certificate',
              style: textTheme.subtitle1,
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.open_in_new_rounded,
              color: isDark ? Colors.white : Colors.black,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
