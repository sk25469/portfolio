import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/contact_form.dart';
import 'package:portfolio/widgets/contact_me_card.dart';

const _kSize = 1536;

class ContactMeComponent extends StatelessWidget {
  const ContactMeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    double width = MediaQuery.of(context).size.width;
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
                  left: 30 / _kSize * width,
                  top: 8 / _kSize * width,
                ),
                width: 0.5 * width,
                child: const ContactForm(),
              ),
              SizedBox(width: 40 / _kSize * width),
              Padding(
                padding: EdgeInsets.only(top: 25.0 / _kSize * width),
                child: const ContactMeCard(),
              ),
            ],
          ),
          SizedBox(height: 50 / _kSize * width),
          Container(
            width: double.infinity,
            height: 33 / _kSize * width,
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
    padding: EdgeInsets.symmetric(horizontal: 30.0 / _kSize * width),
    child: SelectableText(
      'Contact Me',
      style: currentTextTheme.bodyText1,
    ),
  );
}
