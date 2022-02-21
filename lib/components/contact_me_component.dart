import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/contact_form.dart';
import 'package:portfolio/widgets/contact_me_card.dart';

class ContactMeComponent extends StatelessWidget {
  const ContactMeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 8,
                ),
                width: 0.5 * width,
                child: const ContactForm(),
              ),
              const SizedBox(width: 40),
              const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: ContactMeCard(),
              ),
            ],
          ),
          const SizedBox(height: 50),
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

Widget _welcomeText(TextTheme currentTextTheme) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: SelectableText(
      'Contact Me',
      style: currentTextTheme.bodyText1,
    ),
  );
}
