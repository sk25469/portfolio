import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/model/project_model.dart';

import '../widgets/project_tile.dart';

const _kWidth = 1536;
const _kHeight = 745;

class SplashOnHover extends StatefulWidget {
  final Project project;
  const SplashOnHover({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<SplashOnHover> createState() => _SplashOnHover();
}

class _SplashOnHover extends State<SplashOnHover> {
  bool _hovering = false;

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: SizedBox(
        width: 0.45 * width,
        height: 180 / _kHeight * height,
        child: Stack(
          children: [
            Positioned(
              top: -20 / _kHeight * height,
              right: -20 / _kWidth * width,
              child: AnimatedContainer(
                width: _hovering ? 1500 : 40,
                height: _hovering ? 1500 : 40,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      darkPurple,
                      lightPurple.withOpacity(0.7),
                    ],
                  ),
                ),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCirc,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: ProjectTile(
                isHovering: _hovering,
                project: widget.project,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
