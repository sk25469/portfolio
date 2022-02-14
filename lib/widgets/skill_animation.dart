import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SkillAnimation extends StatefulWidget {
  const SkillAnimation({Key? key}) : super(key: key);

  @override
  _SkillAnimationState createState() => _SkillAnimationState();
}

class _SkillAnimationState extends State<SkillAnimation> {
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
    return SizedBox(
      child: RiveAnimation.asset(
        'assets/animation/upload-animation.riv',
        animations: const ['Appearing'],
        controllers: [_controller],
      ),
    );
  }
}
