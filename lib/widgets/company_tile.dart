import 'package:flutter/material.dart';
import 'package:portfolio/model/company_model.dart';

const _kWidth = 1536;
const _kHeight = 745;

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double containerWidth = 380, containerHeight = 480;
    int hasMoreColors = company.colors.length;

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: _isDark ? Colors.black.withOpacity(0.8) : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:
                !_isDark ? Colors.black.withOpacity(0.1) : Colors.white.withOpacity(0.1),
            blurRadius: 7,
            // offset: const Offset(-10, 10),
            spreadRadius: 7,
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
              // height: 100,
              width: 100,
              padding: EdgeInsets.symmetric(
                horizontal: 5 / _kWidth * width,
                vertical: 3 / _kHeight * height,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _isDark ? Colors.black : Colors.white,
              ),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  company.name,
                  style: textTheme.headline4,
                ),
              ),
            ),
            top: 20 / _kHeight * height,
            left: containerWidth / 2 - 50 / _kWidth * width,
          ),
          Positioned(
            child: Container(
              width: 70,
              height: 70,
              alignment: Alignment.topCenter,
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
            top: 70 / _kHeight * height,
            left: containerWidth / 2 - 35 / _kWidth * width,
          ),
          Positioned(
            child: Container(
              width: containerWidth,
              height: 3 / 4 * containerHeight - 50 / _kHeight * height,
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0 / _kWidth * width),
                child: _buildCompanyDescription(
                  company: company,
                  textTheme: textTheme,
                ),
              ),
            ),
            top: containerHeight / 4 + 30 / _kHeight * height,
            left: 10 / _kWidth * width,
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _buildCompanyDescription extends StatelessWidget {
  final Company company;
  final TextTheme textTheme;
  const _buildCompanyDescription({
    Key? key,
    required this.company,
    required this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SelectableText(
          company.designation,
          // headline2
          style: textTheme.headline2,
        ),
        SizedBox(height: 5 / _kHeight * height),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              company.startDate,
              style: textTheme.subtitle1,
            ),
            SelectableText(
              ' - ' + company.endDate,
              style: textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(height: 10 / _kHeight * height),
        SelectableText(
          company.description,
          style: textTheme.headline4,
        ),
      ],
    );
  }
}
