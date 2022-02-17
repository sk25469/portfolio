import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/bio_component.dart';
import 'package:portfolio/components/experience_component.dart';
import 'package:portfolio/components/project_component.dart';
import 'package:portfolio/components/skills_component.dart';
import 'package:portfolio/constants/custom_theme.dart';

const _kSize = 1536;

class HomePage extends StatefulWidget {
  final AdaptiveThemeMode mode;
  const HomePage({
    Key? key,
    required this.mode,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  bool _isDarkMode = false;
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        if (_controller.offset >= 100) {
          _showBackToTopButton = true; // show the back-to-top button
        } else {
          _showBackToTopButton = false; // hide the back-to-top button
        }
      });
    });
    _isDarkMode = widget.mode == AdaptiveThemeMode.dark;
  }

  @override
  void dispose() {
    _controller.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final textTheme = themeData.textTheme;
    final _itemExtent = 600 / _kSize * width;

    void _animateToIndex(int index) {
      _controller.animateTo(
        index * _itemExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: _showBackToTopButton
            ? FloatingActionButton(
                onPressed: () {
                  _animateToIndex(0);
                },
                child: Icon(
                  Icons.arrow_upward_outlined,
                  color: _isDarkMode ? Colors.black : Colors.white,
                ),
                backgroundColor: _isDarkMode ? lightBackgroundColor : darkBackgroundColor,
              )
            : null,
        body: CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            SliverAppBar(
              elevation: 10,
              centerTitle: true,
              floating: true,
              toolbarHeight: 80 / _kSize * width,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0 / _kSize * width),
                      child: Image.asset(
                        "assets/images/signature.png",
                        alignment: Alignment.center,
                        width: 200 / _kSize * width,
                        height: 200 / _kSize * width,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350 / _kSize * width,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _animateToIndex(1);
                        },
                        hoverColor: _isDarkMode ? Colors.black : Colors.white,
                        child: _buildAppBarButton(
                          text: 'Skills',
                          width: width,
                          isDarkMode: _isDarkMode,
                          textTheme: textTheme,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _animateToIndex(2);
                        },
                        hoverColor: _isDarkMode ? Colors.black : Colors.white,
                        child: _buildAppBarButton(
                          text: 'Projects',
                          isDarkMode: _isDarkMode,
                          width: width,
                          textTheme: textTheme,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _animateToIndex(3);
                        },
                        hoverColor: _isDarkMode ? Colors.black : Colors.white,
                        child: _buildAppBarButton(
                          text: 'Work Experience',
                          isDarkMode: _isDarkMode,
                          width: width,
                          textTheme: textTheme,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _animateToIndex(4);
                        },
                        hoverColor: _isDarkMode ? Colors.black : Colors.white,
                        child: _buildAppBarButton(
                          text: 'Achivements',
                          isDarkMode: _isDarkMode,
                          width: width,
                          textTheme: textTheme,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _animateToIndex(5);
                        },
                        hoverColor: _isDarkMode ? Colors.black : Colors.white,
                        child: _buildAppBarButton(
                          text: 'Contact Me',
                          isDarkMode: _isDarkMode,
                          width: width,
                          textTheme: textTheme,
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
                ],
              ),
              backgroundColor: themeData.accentColor,
            ),
            SliverFixedExtentList(
              itemExtent: _itemExtent,
              delegate: SliverChildListDelegate(
                [
                  const BioComponent(),
                  const SkillComponent(),
                  const ProjectComponent(),
                  const ExperienceComponent(),
                  Container(color: Colors.yellow),
                  Container(color: Colors.pink),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAppBarButton({
  required String text,
  required bool isDarkMode,
  required double width,
  required TextTheme textTheme,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20 / _kSize * width),
    child: SizedBox(
      height: 55 / _kSize * width,
      child: Text(
        text,
        style: textTheme.headline1,
      ),
    ),
  );
}
