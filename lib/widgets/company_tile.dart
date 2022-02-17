import 'package:flutter/material.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/model/company_model.dart';

class CompanyTile extends StatelessWidget {
  final Company company;
  const CompanyTile({
    Key? key,
    required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    double containerWidth = 300, containerHeight = 450;
    int hasMoreColors = company.colors.length;

    return Container(
      width: containerWidth,
      height: containerHeight,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        color: _isDark ? darkBackgroundColor : lightBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:
                !_isDark ? Colors.black.withOpacity(0.1) : Colors.white.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(7, 7),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 1 / 4 * containerHeight,
              width: containerWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: company.colors[0],
              ),
            ),
            top: 0,
            left: 0,
          ),
          if (hasMoreColors > 1)
            Positioned(
              child: Container(
                height: 1 / 4 * containerHeight,
                width: containerWidth / 3,
                decoration: BoxDecoration(
                  color: company.colors[1],
                ),
              ),
              top: 0,
              left: containerWidth / 4,
            ),
          if (hasMoreColors > 2)
            Positioned(
              child: Container(
                height: 1 / 4 * containerHeight,
                width: containerWidth / 3,
                decoration: BoxDecoration(
                  color: company.colors[2],
                ),
              ),
              top: 0,
              left: 2 * containerWidth / 4,
            ),
          if (hasMoreColors > 3)
            Positioned(
              child: Container(
                height: 1 / 4 * containerHeight,
                width: containerWidth / 4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: company.colors[3],
                ),
              ),
              top: 0,
              left: 3 * containerWidth / 4,
            ),
          Positioned(
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Image.asset(
                company.imageAssetPath,
                width: 70,
                height: 70,
              ),
            ),
            top: 70,
            left: containerWidth / 2 - 35,
          ),
          Positioned(
            child: Container(
              width: containerWidth,
              height: 3 / 4 * containerHeight - 50,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SelectableText(
                  company.description,
                  style: textTheme.headline3,
                ),
              ),
            ),
            top: containerHeight / 4 + 30,
            left: 10,
          )
        ],
      ),
    );
  }
}
