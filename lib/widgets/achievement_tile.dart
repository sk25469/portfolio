import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/model/achievement_model.dart';
import 'package:portfolio/widgets/gradient_button.dart';
import 'package:url_launcher/url_launcher.dart';

const _kWidth = 1536;
const _kHeight = 745;

class AchievementTile extends HookWidget {
  final Achievement achievement;
  const AchievementTile({
    Key? key,
    required this.achievement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double containerWidth = 300, containerHeight = 440;

    bool _isYearNeeded = achievement.assetName.contains('codejam') ||
        achievement.assetName.contains('kickstart');

    final isHovering = useState(false);

    final _mouseEnter = useCallback((bool hover) {
      isHovering.value = hover;
    }, [isHovering]);

    void _launchURL(String _url) async {
      if (!await launch(_url)) throw 'Could not launch $_url';
    }

    return MouseRegion(
      onEnter: (event) => _mouseEnter(true),
      onExit: (event) => _mouseEnter(false),
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          color: _isDark ? Colors.black.withOpacity(0.8) : Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:
                  _isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
              blurRadius: !isHovering.value ? 5 : 8,
              spreadRadius: !isHovering.value ? 5 : 8,
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(containerWidth / 2 + 20),
                  child: Image.asset(
                    achievement.assetName,
                    width: containerWidth,
                    height: containerHeight / 2,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              top: containerHeight / 32,
              left: containerWidth / 64 - 5 / _kWidth * width,
            ),
            if (_isYearNeeded)
              Positioned(
                child: const Text(
                  '2021',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'ZenKakuGothicAntique-Medium',
                    fontSize: 60,
                  ),
                ),
                top: containerHeight / 8 + 18 / _kHeight * height,
                left: containerWidth / 2 - 50 / _kWidth * width,
              ),
            Positioned(
              child: Container(
                width: containerWidth,
                height: containerHeight / 2,
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0 / _kWidth * width,
                    vertical: 5 / _kHeight * height,
                  ),
                  child: _buildAchievementDescription(
                    achievement: achievement,
                    textTheme: textTheme,
                  ),
                ),
              ),
              top: 0.535 * containerHeight,
              left: 10 / _kWidth * width,
            ),
            Positioned(
              child: GradientButton(
                text: 'View Certificate',
                onPressed: () {
                  _launchURL(achievement.certificateUrl);
                },
                isCertificate: true,
              ),
              bottom: 0.05 * containerHeight,
              left: containerWidth / 2 - 65 / _kWidth * width,
            )
          ],
        ),
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
