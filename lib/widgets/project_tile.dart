import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/utils/custom_utils.dart';

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({
    Key? key,
    required this.project,
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
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _isDark ? darkBackgroundColor : lightBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: !_isDark
                    ? Colors.black.withOpacity(.05)
                    : Colors.white.withOpacity(.05),
                offset: const Offset(5, 5),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _projectTitle(project.title, textTheme, _isDark),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SelectableText(
                  project.description,
                  style: textTheme.headline3,
                ),
              ),
              _projectDetail(project, textTheme),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _projectTitle(String text, TextTheme textTheme, bool isDark) {
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
        SelectableText(
          text,
          style: textTheme.headline5,
        ),
      ],
    ),
  );
}

Widget _projectDetail(Project project, TextTheme textTheme) {
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
        child: SelectableText(
          project.language,
          style: textTheme.headline3,
        ),
      ),
      const SizedBox(width: 500),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SelectableText(
          kbToMB(project.size),
          style: textTheme.headline3,
        ),
      )
    ],
  );
}
