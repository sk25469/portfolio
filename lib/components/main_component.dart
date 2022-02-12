import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;

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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/signature.png",
                      alignment: Alignment.center,
                      scale: 10,
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      hoverColor: themeData.accentColor,
                      child: _buildAppBarButton(
                        text: 'Achivements',
                        themeData: themeData,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      hoverColor: themeData.accentColor,
                      child: _buildAppBarButton(
                        text: 'Skills',
                        themeData: themeData,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      hoverColor: themeData.accentColor,
                      child: _buildAppBarButton(
                        text: 'Projects',
                        themeData: themeData,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      hoverColor: themeData.accentColor,
                      child: _buildAppBarButton(
                        text: 'Work Experience',
                        themeData: themeData,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      hoverColor: themeData.accentColor,
                      child: _buildAppBarButton(
                        text: 'Contact Me',
                        themeData: themeData,
                      ),
                    ),
                    // CupertinoSwitch(
                    //   value: _isDarkMode,
                    //   onChanged: (newVal) {
                    //     setState(() {
                    //       _isDarkMode = newVal;
                    //       if (_isDarkMode) {
                    //         AdaptiveTheme.of(context).setLight();
                    //       } else {
                    //         AdaptiveTheme.of(context).setDark();
                    //       }
                    //     });
                    //   },
                    // ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_isDarkMode) {
                            AdaptiveTheme.of(context).setLight();
                          } else {
                            AdaptiveTheme.of(context).setDark();
                          }
                          _isDarkMode = !_isDarkMode;
                        });
                      },
                      icon: _isDarkMode
                          ? const Icon(
                              Icons.dark_mode,
                              color: Colors.white,
                              size: 30,
                            )
                          : const Icon(
                              Icons.dark_mode_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: themeData.primaryColor,
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

Widget _buildAppBarButton({
  required String text,
  required ThemeData themeData,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: SizedBox(
      height: 55,
      child: Text(
        text,
        style: themeData.textTheme.headlineMedium,
      ),
    ),
  );
}
