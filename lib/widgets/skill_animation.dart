import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SkillAnimation extends StatefulWidget {
  const SkillAnimation({Key? key}) : super(key: key);

  @override
  _SkillAnimationState createState() => _SkillAnimationState();
}

class _SkillAnimationState extends State<SkillAnimation> {
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'Appearing',
      autoplay: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
