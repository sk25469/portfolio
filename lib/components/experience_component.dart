import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/constants/data.dart';
import 'package:portfolio/widgets/company_tile.dart';

const _kWidth = 1536;
const _kHeight = 745;

class ExperienceComponent extends StatelessWidget {
  const ExperienceComponent({Key? key}) : super(key: key);

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
          Padding(
            padding: EdgeInsets.only(
              left: 30 / _kWidth * width,
              top: 10 / _kHeight * height,
            ),
            child: Row(
              children: [
                CompanyTile(company: CompanyData.company[0]),
                SizedBox(width: 30 / _kWidth * width),
                CompanyTile(company: CompanyData.company[1]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _welcomeText(TextTheme currentTextTheme, double width) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 30.0 / _kWidth * width,
    ),
    child: SelectableText(
      'Work Experience',
      style: currentTextTheme.bodyText1,
    ),
  );
}
