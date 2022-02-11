import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          floating: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                height: 55,
                hoverColor: Colors.purple,
                onPressed: () {},
                child: const Text(
                  'Achievements',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              MaterialButton(
                height: 55,
                hoverColor: Colors.purple,
                onPressed: () {},
                child: const Text(
                  'Skills',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              MaterialButton(
                height: 55,
                hoverColor: Colors.purple,
                onPressed: () {},
                child: const Text(
                  'Work experience',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              MaterialButton(
                height: 55,
                hoverColor: Colors.purple,
                onPressed: () {},
                child: const Text(
                  'Open Source',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              MaterialButton(
                height: 55,
                hoverColor: Colors.purple,
                onPressed: () {},
                child: const Text(
                  'Contact Me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          leading: const Placeholder(),
          backgroundColor: Colors.black,

          // expandedHeight: 200.0,
        ),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red),
              Container(color: Colors.purple),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
              Container(color: Colors.pink),
            ],
          ),
        ),
      ],
    );
  }
}
