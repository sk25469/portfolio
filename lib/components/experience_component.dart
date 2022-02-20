import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/constants/data.dart';
import 'package:portfolio/widgets/company_tile.dart';

class ExperienceComponent extends StatelessWidget {
  const ExperienceComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    // final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: ComponentBoxDecoration.getBoxDecoration(_isDark, theme),
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeText(textTheme),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Row(
              children: [
                CompanyTile(company: CompanyData.company[0]),
                const SizedBox(width: 30),
                CompanyTile(company: CompanyData.company[1]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 30.0,
      vertical: 0,
    ),
    child: SelectableText(
      'Work Experience',
      style: currentTextTheme.bodyText1,
    ),
  );
}
