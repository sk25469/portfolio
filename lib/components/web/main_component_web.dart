import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/mobile/main_component_mobile.dart';
import 'package:portfolio/components/web/achievement_component_web.dart';
import 'package:portfolio/components/web/bio_component_web.dart';
import 'package:portfolio/components/web/contact_me_component_web.dart';
import 'package:portfolio/components/web/experience_component_web.dart';
import 'package:portfolio/components/web/know_me_component_web.dart';
import 'package:portfolio/components/web/project_component_web.dart';
import 'package:portfolio/components/web/skills_component_web.dart';
import 'package:portfolio/constants/custom_theme.dart';

const _kWidth = 1536;
const _kHeight = 745;

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
          _showBackToTopButton = true;
        } else {
          _showBackToTopButton = false;
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final textTheme = themeData.textTheme;
    double _itemExtent = 600 / _kHeight * height;

    void _animateToIndex(int index) {
      _controller.animateTo(
        index * _itemExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }

    /// breakpoints - for different screen sizes
    /// mobile size <= 640
    /// tablet size > 640 && <= 1024
    /// desktop size > 1024
    print('height is $height');
    print('width is $width');

    return LayoutBuilder(
      builder: ((BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 640) {
          return MainComponentMobile(adaptiveThemeMode: widget.mode);
        } else {
          return PreferredSize(
            preferredSize: Size(width, height),
            child: Scaffold(
              backgroundColor: _isDarkMode ? Colors.black : Colors.white,
              floatingActionButton: _showBackToTopButton
                  ? FloatingActionButton(
                      onPressed: () {
                        _animateToIndex(0);
                      },
                      child: const Icon(
                        Icons.arrow_upward_outlined,
                        color: Colors.white,
                      ),
                      backgroundColor: lightPurple,
                    )
                  : null,
              body: Scrollbar(
                showTrackOnHover: true,
                thickness: 10,
                controller: _controller,
                child: CustomScrollView(
                  controller: _controller,
                  slivers: <Widget>[
                    SliverAppBar(
                      elevation: 10,
                      centerTitle: true,
                      floating: true,
                      toolbarHeight: 80 / _kHeight * height,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0 / _kWidth * width,
                                vertical: 8.0 / _kHeight * height,
                              ),
                              child: Image.asset(
                                "assets/images/signature.png",
                                alignment: Alignment.center,
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  _animateToIndex(1);
                                },
                                hoverColor: _isDarkMode
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.6),
                                child: _buildAppBarButton(
                                  text: 'Skills',
                                  isDarkMode: _isDarkMode,
                                  textTheme: textTheme,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _animateToIndex(3);
                                },
                                hoverColor: _isDarkMode
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.6),
                                child: _buildAppBarButton(
                                  text: 'Projects',
                                  isDarkMode: _isDarkMode,
                                  textTheme: textTheme,
                                ),
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     _animateToIndex(4);
                              //   },
                              //   hoverColor: _isDarkMode
                              //       ? Colors.black.withOpacity(0.6)
                              //       : Colors.white.withOpacity(0.6),
                              //   child: _buildAppBarButton(
                              //     text: 'Work Experience',
                              //     isDarkMode: _isDarkMode,
                              //     textTheme: textTheme,
                              //   ),
                              // ),
                              InkWell(
                                onTap: () {
                                  _animateToIndex(4);
                                },
                                hoverColor: _isDarkMode
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.6),
                                child: _buildAppBarButton(
                                  text: 'Achievements',
                                  isDarkMode: _isDarkMode,
                                  textTheme: textTheme,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _animateToIndex(5);
                                },
                                hoverColor: _isDarkMode
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.6),
                                child: _buildAppBarButton(
                                  text: 'Contact Me',
                                  isDarkMode: _isDarkMode,
                                  textTheme: textTheme,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.only(
                                  left: 3 / _kWidth * width,
                                ),
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
                          const KnowMeComponent(),
                          const ProjectComponent(),
                          // const ExperienceComponent(),
                          const AchievementComponent(),
                          const ContactMeComponent(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}

// ignore: camel_case_types
class _buildAppBarButton extends StatelessWidget {
  final String text;
  final bool isDarkMode;
  final TextTheme textTheme;

  const _buildAppBarButton({
    Key? key,
    required this.text,
    required this.isDarkMode,
    required this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        left: 15 / _kWidth * width,
        right: 15 / _kWidth * width,
        top: 5 / _kHeight * height,
        bottom: 5 / _kHeight * height,
      ),
      child: SizedBox(
        child: Text(
          text,
          style: textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
