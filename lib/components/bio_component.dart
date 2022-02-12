import 'package:flutter/material.dart';
import 'package:portfolio/constants/customtheme.dart';

class BioComponent extends StatelessWidget {
  const BioComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTextTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    return Container(
      color: theme.accentColor,
      padding: const EdgeInsets.only(top: 80),
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hi, I\'m Sahil',
                  style: currentTextTheme.bodyText1,
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Image.asset(
                    'assets/images/hello_world.png',
                    height: 70,
                    width: 70,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 800,
                  child: Text(
                    'An aspiring Full Stack Software Developer 🚀 having an experience in building Web and Mobile applications with Flutter/Spring Boot (Java).',
                    style: currentTextTheme.bodyText2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
