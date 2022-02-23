import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/constants/data.dart';
import 'package:portfolio/extensions/splash_on_hover.dart';
import 'package:portfolio/widgets/custom_button.dart';

const _kWidth = 1536;
const _kHeight = 745;

class ProjectComponent extends StatelessWidget {
  const ProjectComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final currentTextTheme = Theme.of(context).textTheme;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
      child: Container(
        decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
        child: Stack(
          children: [
            Positioned(
              left: 30 / _kWidth * width,
              child: _welcomeText(currentTextTheme),
            ),
            Positioned(
              left: 30 / _kWidth * width,
              top: 100 / _kHeight * height,
              child: SplashOnHover(project: ProjectData.projectList[0]),
            ),
            Positioned(
              left: 30 / _kWidth * width,
              top: 300 / _kHeight * height,
              child: SplashOnHover(project: ProjectData.projectList[1]),
            ),
            Positioned(
              left: 0.5 * width,
              top: 100 / _kHeight * height,
              child: SplashOnHover(project: ProjectData.projectList[2]),
            ),
            Positioned(
              left: 0.5 * width,
              top: 300 / _kHeight * height,
              child: SplashOnHover(project: ProjectData.projectList[3]),
            ),
            Positioned(
              left: 0.40 * width,
              top: 520 / _kHeight * height,
              child: const CustomButton(
                text: 'MORE PROJECTS',
                isResume: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme) {
  return SelectableText(
    'Open Source Projects',
    style: currentTextTheme.bodyText1,
  );
}
