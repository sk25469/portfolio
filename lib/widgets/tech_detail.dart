import 'package:flutter/material.dart';

const _kWidth = 1536;
const _kHeight = 745;

class TechTile extends StatelessWidget {
  final Image techImage;
  final String techName;
  const TechTile({
    Key? key,
    required this.techImage,
    required this.techName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: Column(
        children: [
          techImage,
          SizedBox(height: 8 / _kHeight * height),
          Text(
            techName,
            style: textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
