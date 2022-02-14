import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:rive/rive.dart';

class SkillComponent extends StatelessWidget {
  const SkillComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(
        _isDark,
        theme,
      ),
      child: Stack(
        children: const [
          Positioned(
            child: RiveAnimation.asset('assets/animation/upload-animation.riv'),
            bottom: 0,
            left: 10,
          )
        ],
      ),
    );
  }
}
