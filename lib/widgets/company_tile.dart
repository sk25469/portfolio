import 'package:flutter/material.dart';
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
    double containerWidth = 400, containerHeight = 470;
    int hasMoreColors = company.colors.length;

    return Container(
      width: containerWidth,
      height: containerHeight,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        color: _isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:
                !_isDark ? Colors.black.withOpacity(0.1) : Colors.white.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(-10, 10),
            spreadRadius: 5,
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
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3,
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
            top: 20,
            left: containerWidth / 2 - 50,
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
                child: _buildCompanyDescription(
                  company: company,
                  textTheme: textTheme,
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
    return Column(
      children: [
        SelectableText(
          company.designation,
          // headline2
          style: textTheme.headline2,
        ),
        const SizedBox(height: 5),
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
        const SizedBox(height: 10),
        SelectableText(
          company.description,
          style: textTheme.headline4,
        ),
      ],
    );
  }
}
