import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/bio_component.dart';
import 'package:portfolio/components/project_component.dart';
import 'package:portfolio/components/skills_component.dart';
import 'package:portfolio/constants/custom_theme.dart';

const _kSize = 1536;

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
    final width = MediaQuery.of(context).size.width;
    // print('size of the screen is ' + width.toString());
    return PreferredSize(
      preferredSize: Size(width, 1000),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 10,
            centerTitle: true,
            floating: true,
            toolbarHeight: 80 / _kSize * width,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2 * _kSize * width.toInt(),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0 / _kSize * width),
                      child: Image.asset(
                        "assets/images/signature.png",
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4 * _kSize * width.toInt(),
                  child: const SizedBox(),
                ),
                Expanded(
                  flex: 8 * _kSize * width.toInt(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        hoverColor: _isDarkMode ? Colors.black : Colors.white,
                        child: _buildAppBarButton(
                          text: 'Skills',
                          width: width,
                          isDarkMode: _isDarkMode,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        hoverColor: _isDarkMode ? Colors.black : Colors.white,
                        child: _buildAppBarButton(
                          text: 'Projects',
                          isDarkMode: _isDarkMode,
                          width: width,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        hoverColor: _isDarkMode ? Colors.black : Colors.white,
                        child: _buildAppBarButton(
                          text: 'Work Experience',
                          isDarkMode: _isDarkMode,
                          width: width,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        hoverColor: _isDarkMode ? Colors.black : Colors.white,
                        child: _buildAppBarButton(
                          text: 'Achivements',
                          isDarkMode: _isDarkMode,
                          width: width,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        hoverColor: _isDarkMode ? Colors.black : Colors.white,
                        child: _buildAppBarButton(
                          text: 'Contact Me',
                          isDarkMode: _isDarkMode,
                          width: width,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(bottom: 3 / _kSize * width),
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
                            ? Icon(
                                Icons.dark_mode,
                                color: Colors.white,
                                size: 0.02 * width,
                              )
                            : Icon(
                                Icons.dark_mode_outlined,
                                color: Colors.black,
                                size: 0.02 * width,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            backgroundColor: themeData.accentColor,
          ),
          SliverFixedExtentList(
            itemExtent: 600 / _kSize * width,
            delegate: SliverChildListDelegate(
              [
                const BioComponent(),
                const SkillComponent(),
                const ProjectComponent(),
                Container(color: Colors.orange),
                Container(color: Colors.yellow),
                Container(color: Colors.pink),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildAppBarButton({
  required String text,
  required bool isDarkMode,
  required double width,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20 / _kSize * width),
    child: SizedBox(
      height: 55 / _kSize * width,
      child: Text(
        text,
        style: ComponentTextStyle.getTextStyle(isDarkMode, width).headline4,
      ),
    ),
  );
}
