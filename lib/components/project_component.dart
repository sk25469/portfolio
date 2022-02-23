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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 30 / _kWidth * width),
              child: _welcomeText(currentTextTheme),
            ),
            Container(
              padding: EdgeInsets.only(top: 20 / _kHeight * height),
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 40 / _kWidth * width,
                    ),
                    child: SplashOnHover(project: ProjectData.projectList[0]),
                  ),
                  SizedBox(width: 30 / _kWidth * width),
                  SizedBox(
                    child: SplashOnHover(project: ProjectData.projectList[1]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25 / _kHeight * height),
            SizedBox(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 40 / _kWidth * width,
                    ),
                    child: SplashOnHover(project: ProjectData.projectList[2]),
                  ),
                  SizedBox(width: 30 / _kWidth * width),
                  SizedBox(
                    child: SplashOnHover(project: ProjectData.projectList[3]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30 / _kHeight * height),
            Container(
              padding: EdgeInsets.only(
                left: 0.4 * width,
              ),
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
