import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({Key? key}) : super(key: key);

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
        child: Container(
          width: 0.5 * width,
          height: 225,
          child: Card(
            color: _isDark ? darkBackgroundColor : lightBackgroundColor,
            elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _projectTitle('This is a project Title', textTheme, _isDark),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SelectableText(
                    'Project Description' * 6,
                    style: textTheme.subtitle1,
                  ),
                ),
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
