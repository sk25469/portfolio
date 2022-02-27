import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Divider(
        height: 15,
        thickness: 1,
        indent: 10,
        endIndent: 10,
        color: _isDark ? Colors.white : Colors.black,
      ),
    );
  }
}
