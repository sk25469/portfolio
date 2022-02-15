import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final _isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 500,
      height: 200,
      child: Card(
        color: _isDark ? darkBackgroundColor : lightBackgroundColor,
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _projectTitle('This is a project Title', textTheme),
            const SizedBox(height: 10),
            Container(
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SelectableText(
                'Project Description' * 6,
                style: textTheme.subtitle1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _projectTitle(String text, TextTheme textTheme) {
  return Row(
    children: [
      const SizedBox(width: 20),
      // const Image.asset(name)
      Text(
        text,
        style: textTheme.bodyText2,
      ),
    ],
  );
}
