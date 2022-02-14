import 'package:flutter/material.dart';

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
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: Column(
        children: [
          techImage,
          const SizedBox(height: 8),
          Text(
            techName,
            style: textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
