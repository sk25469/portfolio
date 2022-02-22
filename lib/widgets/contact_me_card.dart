import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/social_media.dart';

const _kWidth = 1536;
const _kHeight = 745;

class ContactMeCard extends HookWidget {
  const ContactMeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double _height = 400 / _kHeight * height;
    bool _isDark = Theme.of(context).brightness == Brightness.dark;

    final isHovering = useState(false);

    final _mouseEnter = useCallback((bool hover) {
      isHovering.value = hover;
    }, [isHovering]);

    return MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: Container(
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
              blurRadius: !isHovering.value ? 5 : 10,
              spreadRadius: !isHovering.value ? 5 : 10,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.0 / _kHeight * height,
            left: 25 / _kWidth * width,
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: SizedBox(
            width: 450 / _kWidth * width,
            child: const SelectableText(
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
          right: 15 / _kWidth * width,
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
          child: const SocialMediaContacts(
            hasResume: false,
            iconSize: 50,
            iconPadding: 0,
          ),
          top: 250 / _kHeight * height,
          width: 400 / _kWidth * width,
        ),
      ],
    );
  }
}
