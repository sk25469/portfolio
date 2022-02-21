import 'package:flutter/material.dart';
import 'package:portfolio/extensions/hovering_widget.dart';
import 'package:portfolio/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

const _kSize = 1536;

class SocialMediaContacts extends StatelessWidget {
  final double width;
  final bool hasResume;
  final double iconSize;
  final double iconPadding;
  const SocialMediaContacts({
    Key? key,
    required this.width,
    required this.hasResume,
    required this.iconSize,
    required this.iconPadding,
  }) : super(key: key);

  // initial - iconSize = 60, padding = 15

  @override
  Widget build(BuildContext context) {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sk25469@gmail.com',
      query: encodeQueryParameters(
        <String, String>{'subject': 'Portfolio Inquiry'},
      ),
    );

    void _launchURL(String _url) async {
      if (!await launch(_url)) throw 'Could not launch $_url';
    }

    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              launch(emailLaunchUri.toString());
            },
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/email.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          SizedBox(width: iconPadding / _kSize * width),
          InkWell(
            onTap: () {
              const url = 'https://github.com/sk25469';
              _launchURL(url);
            },
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/github.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          SizedBox(width: iconPadding / _kSize * width),
          InkWell(
            onTap: () {
              const url = 'https://www.linkedin.com/in/sahilsarwar1/';
              _launchURL(url);
            },
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/linkedin.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          SizedBox(width: iconPadding / _kSize * width),
          InkWell(
            onTap: () {
              const url = 'https://twitter.com/SahilSarwar15';
              _launchURL(url);
            },
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/twitter.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          SizedBox(width: iconPadding / _kSize * width),
          InkWell(
            onTap: () {
              const url = 'https://www.instagram.com/the_originalsahil';
              _launchURL(url);
            },
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/instagram.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          SizedBox(width: iconPadding / _kSize * width),
          InkWell(
            onTap: () {
              const url = 'https://www.facebook.com/TheOriginalSahil';
              _launchURL(url);
            },
            hoverColor: Colors.transparent,
            child: TranslateOnHover(
              child: Image.asset(
                'assets/icons/facebook.png',
                width: iconSize / _kSize * width,
                height: iconSize / _kSize * width,
              ),
            ),
          ),
          if (hasResume) SizedBox(width: 150 / _kSize * width),
          if (hasResume)
            const CustomButton(
              text: 'SEE MY RESUME',
              isResume: true,
            ),
        ],
      ),
    );
  }
}
