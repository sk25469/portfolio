import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/social_media.dart';

class ContactMeCard extends StatelessWidget {
  const ContactMeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const double _height = 400;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 0.45 * width,
      height: _height,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/abstract_bg.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:
                _isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
          left: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SelectableText(
              'Reach Out To Me',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Monoton-Regular',
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 0.45 * width,
              height: 0.8 * _height,
              child: const ReachMe(),
            ),
          ],
        ),
      ),
    );
  }
}

class ReachMe extends StatelessWidget {
  const ReachMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final _isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        const Positioned(
          left: 0,
          top: 0,
          child: SizedBox(
            width: 450,
            child: SelectableText(
              'Want to discuss a project? Or just say hi?\nMy inbox is open for all!',
              style: TextStyle(
                fontFamily: 'ZenKakuGothicAntique-Light',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          right: 15,
          top: 0,
          child: CircleAvatar(
            backgroundColor: lightPurple,
            radius: 100,
            child: CircleAvatar(
              child: ClipRRect(
                child: Image.asset('assets/images/sahil_selfie.jpg'),
                borderRadius: BorderRadius.circular(100),
              ),
              radius: 95,
            ),
          ),
        ),
        // Positioned(
        //   child: BlurryContainer(
        //     width: 380,
        //     height: 120,
        //     blur: 5,
        //     child: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         const SizedBox(width: 20.0, height: 130.0),
        //         const Text(
        //           'I am',
        //           style: TextStyle(
        //             fontSize: 35,
        //             fontFamily: 'ZenKakuGothicAntique-Bold',
        //             color: Colors.black,
        //           ),
        //         ),
        //         const SizedBox(width: 15.0, height: 130.0),
        //         DefaultTextStyle(
        //           style: const TextStyle(
        //             fontSize: 40.0,
        //             fontFamily: 'Horizon',
        //             color: Colors.green,
        //           ),
        //           child: AnimatedTextKit(
        //             repeatForever: true,
        //             pause: const Duration(milliseconds: 500),
        //             animatedTexts: [
        //               RotateAnimatedText('AWESOME'),
        //               RotateAnimatedText('OPTIMISTIC'),
        //               RotateAnimatedText('PASSIONATE'),
        //               RotateAnimatedText('ENERGETIC'),
        //               RotateAnimatedText('CREATIVE'),
        //               RotateAnimatedText('INNOVATIVE'),
        //               RotateAnimatedText('ENTHUSIASTIC'),
        //               RotateAnimatedText('CURIOUS'),
        //               RotateAnimatedText('INCREDIBLE'),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   top: 120,
        //   width: 400,
        // ),
        Positioned(
          child: SocialMediaContacts(
            width: width,
            hasResume: false,
            iconSize: 50,
            iconPadding: 0,
          ),
          top: 250,
          left: 0,
          width: 400,
        ),
      ],
    );
  }
}
