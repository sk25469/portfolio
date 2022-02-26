import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/contact_form.dart';
import 'package:portfolio/widgets/contact_me_card.dart';

const _kWidth = 1536;
const _kHeight = 745;

class ContactMeComponent extends StatelessWidget {
  const ContactMeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme, width),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 30 / _kHeight * height,
                  top: 8 / _kWidth * width,
                ),
                width: 0.5 * width,
                child: const ContactForm(),
              ),
              SizedBox(width: 40 / _kWidth * width),
              Padding(
                padding: EdgeInsets.only(top: 25.0 / _kHeight * height),
                child: const ContactMeCard(),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 33,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Center(
              child: Text(
                'Made with ❤️ by Sahil',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme, double width) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.0 / _kWidth * width),
    child: SelectableText(
      'Contact Me',
      style: currentTextTheme.bodyText1,
    ),
  );
}
