import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/utils/custom_utils.dart';

// ignore: must_be_immutable
class ProjectTile extends StatelessWidget {
  final Project project;
  bool isHovering;
  ProjectTile({
    Key? key,
    required this.project,
    required this.isHovering,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final _isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 0.45 * width,
          height: 180,
          // padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: _isDark ? darkBackgroundColor : lightBackgroundColor,

            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: !_isDark
                    ? Colors.black.withOpacity(.05)
                    : Colors.white.withOpacity(.05),
                offset: const Offset(5, 5),
                blurRadius: 0,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _projectTitle(project.title, textTheme, _isDark, isHovering),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SelectableText(
                  project.description,
                  // headline3
                  style: ComponentTextStyle.getTextStyle(isHovering, _isDark).headline3,
                ),
              ),
              _projectDetail(project, textTheme, isHovering, _isDark),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _projectTitle(String text, TextTheme textTheme, bool isDark, bool isHovering) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Row(
      children: [
        Image.asset(
          'assets/icons/idea.png',
          height: 30,
          width: 30,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline5,
        ),
      ],
    ),
  );
}

Widget _projectDetail(
    Project project, TextTheme textTheme, bool isHovering, bool isDark) {
  return Row(
    children: [
      Container(
        width: 15,
        height: 15,
        margin: const EdgeInsets.fromLTRB(20.0, 15, 10, 5),
        decoration: BoxDecoration(
          color: project.languageColor,
          shape: BoxShape.circle,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          project.language,
          style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline3,
        ),
      ),
      const SizedBox(width: 500),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          kbToMB(project.size),
          style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline3,
        ),
      )
    ],
  );
}
