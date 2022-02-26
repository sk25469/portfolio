import 'package:flutter/material.dart';
import 'package:portfolio/widgets/contact_form.dart';
import 'package:portfolio/widgets/contact_me_card.dart';

class ContactMeComponentMobile extends StatelessWidget {
  const ContactMeComponentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(_isDark),
          const SizedBox(height: 10),
          const ContactForm(),
          const SizedBox(height: 16),
          const ContactMeCard(),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

Widget _welcomeText(bool isDark) {
  return SelectableText(
    'Contact Me',
    style: TextStyle(
      color: isDark ? Colors.white : Colors.black,
      fontFamily: 'ZenKakuGothicAntique-Medium',
      fontSize: 50,
    ),
  );
}
