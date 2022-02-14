import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:rive/rive.dart';

class SkillComponent extends StatefulWidget {
  const SkillComponent({Key? key}) : super(key: key);

  @override
  State<SkillComponent> createState() => _SkillComponentState();
}

class _SkillComponentState extends State<SkillComponent> {
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'Appearing',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
    // _controller.isActive = true;
  }

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
        children: [
          Positioned(
            child: RiveAnimation.asset(
              'assets/animation/upload-animation.riv',
              animations: const ['Appearing'],
              controllers: [_controller],
            ),
            top: 40,
            left: 40,
            width: 500,
            height: 500,
          ),
        ],
      ),
    );
  }
}
