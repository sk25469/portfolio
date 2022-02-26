import 'package:flutter/material.dart';
import 'package:portfolio/constants/data.dart';
import 'package:portfolio/extensions/splash_on_hover.dart';
import 'package:portfolio/widgets/custom_button.dart';

class ProjectComponentMobile extends StatelessWidget {
  const ProjectComponentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme),
          Container(
            width: double.infinity,
            child: SplashOnHover(project: ProjectData.projectList[0]),
          ),
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
        ],
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
