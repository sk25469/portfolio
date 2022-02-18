import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HoveringAnimation extends StatefulWidget {
  const HoveringAnimation({Key? key}) : super(key: key);

  @override
  _HoveringAnimationState createState() => _HoveringAnimationState();
}

class _HoveringAnimationState extends State<HoveringAnimation> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'Animation2',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'assets/animation/hovering-animation.riv',
      animations: const ['Animation1', 'Animation2'],
      controllers: [_controller],
    );
  }
}
