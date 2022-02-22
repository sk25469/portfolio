import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/utils/custom_utils.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
const _kWidth = 1536;
const _kHeight = 745;

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void _launchURL(String _url) async {
      if (!await launch(_url)) throw 'Could not launch $_url';
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _launchURL(project.projectUrl);
        },
        child: Container(
          width: 0.45 * width,
          height: 180 / _kHeight * height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: !_isDark
                    ? Colors.black.withOpacity(.09)
                    : Colors.white.withOpacity(.09),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _projectTitle(
                text: project.title,
                textTheme: textTheme,
                isDark: _isDark,
                isHovering: isHovering,
              ),
              SizedBox(height: 10 / _kHeight * height),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20 / _kWidth * width),
                child: Text(
                  project.description,
                  style: ComponentTextStyle.getTextStyle(isHovering, _isDark).headline3,
                ),
              ),
              _projectDetail(
                project: project,
                textTheme: textTheme,
                isHovering: isHovering,
                isDark: _isDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _projectTitle extends StatelessWidget {
  final String text;
  final TextTheme textTheme;
  final bool isDark, isHovering;
  const _projectTitle({
    Key? key,
    required this.text,
    required this.textTheme,
    required this.isDark,
    required this.isHovering,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          10 / _kWidth * width, 10 / _kHeight * height, 10 / _kWidth * width, 0),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/idea.png',
            height: 30 / _kHeight * height,
            width: 30 / _kWidth * width,
          ),
          SizedBox(width: 10 / _kWidth * width),
          Text(
            text,
            style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline5,
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _projectDetail extends StatelessWidget {
  final Project project;
  final TextTheme textTheme;
  final bool isHovering, isDark;
  const _projectDetail({
    Key? key,
    required this.project,
    required this.textTheme,
    required this.isHovering,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          width: 15 / _kWidth * width,
          height: 15 / _kHeight * height,
          margin: EdgeInsets.fromLTRB(
            20.0 / _kWidth * width,
            15 / _kHeight * height,
            10 / _kWidth * width,
            5 / _kHeight * height,
          ),
          decoration: BoxDecoration(
            color: project.languageColor,
            shape: BoxShape.circle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0 / _kHeight * height),
          child: Text(
            project.language,
            style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline3,
          ),
        ),
        SizedBox(width: 500 / _kWidth * width),
        Padding(
          padding: EdgeInsets.only(top: 8.0 / _kHeight * height),
          child: Text(
            kbToMB(project.size),
            style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline3,
          ),
        )
      ],
    );
  }
}
