import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/achievement_component.dart';
import 'package:portfolio/components/bio_component.dart';
import 'package:portfolio/components/contact_me_component.dart';
import 'package:portfolio/components/experience_component.dart';
import 'package:portfolio/components/know_me_component.dart';
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
                            width: width,
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
                            width: width,
                            textTheme: textTheme,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _animateToIndex(4);
                          },
                          hoverColor: _isDarkMode
                              ? Colors.black.withOpacity(0.6)
                              : Colors.white.withOpacity(0.6),
                          child: _buildAppBarButton(
                            text: 'Work Experience',
                            isDarkMode: _isDarkMode,
                            width: width,
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
                            text: 'Achievements',
                            isDarkMode: _isDarkMode,
                            width: width,
                            textTheme: textTheme,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _animateToIndex(6);
                          },
                          hoverColor: _isDarkMode
                              ? Colors.black.withOpacity(0.6)
                              : Colors.white.withOpacity(0.6),
                          child: _buildAppBarButton(
                            text: 'Contact Me',
                            isDarkMode: _isDarkMode,
                            width: width,
                            textTheme: textTheme,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.only(
                            left: 3 / _kSize * width,
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
                    const KnowMeComponent(),
                    const ProjectComponent(),
                    const ExperienceComponent(),
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
}

// ignore: camel_case_types
class _buildAppBarButton extends StatelessWidget {
  final String text;
  final bool isDarkMode;
  final double width;
  final TextTheme textTheme;

  const _buildAppBarButton({
    Key? key,
    required this.text,
    required this.isDarkMode,
    required this.width,
    required this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10 / _kSize * width,
        right: 10 / _kSize * width,
        top: 5 / _kSize * width,
        bottom: 5 / _kSize * width,
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
