import 'package:flutter/material.dart';
import 'package:portfolio/components/appBarButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          floating: true,
          toolbarHeight: 80,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/signature.png",
                      alignment: Alignment.center,
                      scale: 10,
                      width: 100,
                      height: 200,
                      // fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      hoverColor: themeData.accentColor,
                      child: AppBarButton(
                        onPressed: () {},
                        text: 'Achivements',
                      ),
                    ),
                    AppBarButton(
                      onPressed: () {},
                      text: 'Skills',
                    ),
                    AppBarButton(
                      onPressed: () {},
                      text: 'Projects',
                    ),
                    AppBarButton(
                      onPressed: () {},
                      text: 'Work Experience',
                    ),
                    AppBarButton(
                      onPressed: () {},
                      text: 'Contact Me',
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black,

          // expandedHeight: 200.0,
        ),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
            [
              Container(
                child: Image.asset("assets/images/signature.png"),
              ),
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
