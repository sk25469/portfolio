import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/model/project_model.dart';

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
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: SizedBox(
          width: 0.45 * width,
          height: 230,
          child: Card(
            color: _isDark ? darkBackgroundColor : lightBackgroundColor,
            elevation: 10,
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
                    style: textTheme.subtitle1,
                  ),
                ),
                _projectDetail(project, textTheme),
              ],
            ),
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
        width: 30,
        height: 30,
        margin: const EdgeInsets.fromLTRB(20.0, 15, 10, 5),
        decoration: BoxDecoration(
          color: project.languageColor,
          shape: BoxShape.circle,
        ),
      ),
      // const SizedBox(width: 10),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SelectableText(
          project.language,
          style: textTheme.headline4,
        ),
      ),
      const SizedBox(width: 10),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SelectableText(
          project.size.toString() + ' KB',
          style: textTheme.headline4,
        ),
      )
    ],
  );
}
