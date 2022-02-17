import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/utils/custom_utils.dart';

// ignore: must_be_immutable
const _kSize = 1536;

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
          height: 180 / _kSize * width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10 / _kSize * width),
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
              _projectTitle(project.title, textTheme, _isDark, isHovering, width),
              SizedBox(height: 10 / _kSize * width),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20 / _kSize * width),
                child: SelectableText(
                  project.description,
                  style: ComponentTextStyle.getTextStyle(isHovering, _isDark).headline3,
                ),
              ),
              _projectDetail(project, textTheme, isHovering, _isDark, width),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _projectTitle(
    String text, TextTheme textTheme, bool isDark, bool isHovering, double width) {
  return Padding(
    padding: EdgeInsets.fromLTRB(
        10 / _kSize * width, 10 / _kSize * width, 10 / _kSize * width, 0),
    child: Row(
      children: [
        Image.asset(
          'assets/icons/idea.png',
          height: 30 / _kSize * width,
          width: 30 / _kSize * width,
        ),
        SizedBox(width: 10 / _kSize * width),
        Text(
          text,
          style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline5,
        ),
      ],
    ),
  );
}

Widget _projectDetail(
    Project project, TextTheme textTheme, bool isHovering, bool isDark, double width) {
  return Row(
    children: [
      Container(
        width: 15 / _kSize * width,
        height: 15 / _kSize * width,
        margin: EdgeInsets.fromLTRB(20.0 / _kSize * width, 15 / _kSize * width,
            10 / _kSize * width, 5 / _kSize * width),
        decoration: BoxDecoration(
          color: project.languageColor,
          shape: BoxShape.circle,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 8.0 / _kSize * width),
        child: Text(
          project.language,
          style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline3,
        ),
      ),
      SizedBox(width: 500 / _kSize * width),
      Padding(
        padding: EdgeInsets.only(top: 8.0 / _kSize * width),
        child: Text(
          kbToMB(project.size),
          style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline3,
        ),
      )
    ],
  );
}
