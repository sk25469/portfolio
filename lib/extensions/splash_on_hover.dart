import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/model/project_model.dart';

import '../widgets/project_tile.dart';

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
    final width = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: SizedBox(
        width: 0.45 * width,
        height: 180,
        child: Stack(
          children: [
            Positioned(
              top: -25,
              right: -25,
              child: AnimatedContainer(
                width: _hovering ? 1000 : 50,
                height: _hovering ? 1000 : 50,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  color: isDark ? lightBackgroundColor : darkBackgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
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
