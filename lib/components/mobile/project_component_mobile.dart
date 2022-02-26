import 'package:flutter/material.dart';
import 'package:portfolio/constants/data.dart';
import 'package:portfolio/extensions/splash_on_hover.dart';
import 'package:portfolio/widgets/custom_button.dart';

class ProjectComponentMobile extends StatelessWidget {
  const ProjectComponentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme, _isDark),
          const SizedBox(height: 16),
          SplashOnHover(project: ProjectData.projectList[0]),
          const SizedBox(height: 16),
          SplashOnHover(project: ProjectData.projectList[1]),
          const SizedBox(height: 16),
          SplashOnHover(project: ProjectData.projectList[2]),
          const SizedBox(height: 16),
          SplashOnHover(project: ProjectData.projectList[3]),
          const SizedBox(height: 16),
          const Center(
            child: CustomButton(
              text: 'MORE PROJECTS',
              isResume: false,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Divider(
              height: 15,
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: _isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme, bool isDark) {
  return SelectableText(
    'Open Source Projects',
    style: TextStyle(
      color: isDark ? Colors.white : Colors.black,
      fontFamily: 'ZenKakuGothicAntique-Medium',
      fontSize: 50,
    ),
  );
}
