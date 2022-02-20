import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/contact_form.dart';

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
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              top: 8,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 0.5 * width,
                  child: const ContactForm(),
                )
              ],
            ),
          )
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
