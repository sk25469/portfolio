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

    bool _isMobile = width <= 640;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _launchURL(project.projectUrl);
        },
        child: Container(
          width: !_isMobile ? 0.45 * width : width,
          height: !_isMobile ? 0.26 * height : 0.3 * height,
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
              const SizedBox(height: 10),
              Container(
                width: !_isMobile ? 0.45 * width : 0.95 * width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  project.description,
                  style: ComponentTextStyle.getTextStyle(isHovering, _isDark).headline3,
                ),
              ),
              // const SizedBox(height: 5),
              !_isMobile ? const Spacer() : const SizedBox(height: 10),
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
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/idea.png',
            height: 30,
            width: 30,
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(
              left: 4,
              right: 4,
            ),
            child: Text(
              text,
              style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline5,
            ),
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
    bool _isMobile = width <= 640;
    return Container(
      width: _isMobile ? 0.95 * width : 0.45 * width,
      margin: !_isMobile
          ? const EdgeInsets.only(bottom: 20, left: 10, right: 10)
          : const EdgeInsets.only(bottom: 10, left: 10, right: 30),
      child: Row(
        children: [
          Container(
            width: 15,
            height: 15,
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: project.languageColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            project.language,
            style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline3,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              kbToMB(project.size),
              style: ComponentTextStyle.getTextStyle(isHovering, isDark).headline3,
            ),
          )
        ],
      ),
    );
  }
}
