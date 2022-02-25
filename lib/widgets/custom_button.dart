import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:url_launcher/url_launcher.dart';

const _kWidth = 1536;
const _kHeight = 745;

class CustomButton extends StatelessWidget {
  final String text;
  final bool isResume;
  const CustomButton({
    required this.text,
    Key? key,
    required this.isResume,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 15;

    final theme = Theme.of(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void _launchURL(String _url) async {
      if (!await launch(_url)) throw 'Could not launch $_url';
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: lightPurple,
        gradient: const LinearGradient(
          colors: [
            darkPurple,
            lightPurple,
          ],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(
              right: 30,
              left: 30,
              top: 15,
              bottom: 19,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: () {
          if (isResume) {
            const url =
                'https://drive.google.com/file/d/1-A53YpEvsTg2gLTDv2IWkptkxLvjH4MV/view?usp=sharing';
            _launchURL(url);
          } else {
            const url = 'https://github.com/sk25469?tab=repositories';
            _launchURL(url);
          }
        },
        child: Text(
          text,
          style: theme.textTheme.button?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
