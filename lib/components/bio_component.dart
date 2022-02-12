import 'package:flutter/material.dart';

class BioComponent extends StatelessWidget {
  const BioComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          const Text(
            'Hi, I\'m Sahil Sarwar',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
