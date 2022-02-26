import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/mobile/achievement_component_mobile.dart';
import 'package:portfolio/components/mobile/bio_component_mobile.dart';
import 'package:portfolio/components/mobile/contact_me_component_mobile.dart';
import 'package:portfolio/components/mobile/know_me_component_mobile.dart';
import 'package:portfolio/components/mobile/project_component_mobile.dart';
import 'package:portfolio/components/mobile/skills_component_mobile.dart';
import 'package:portfolio/constants/custom_theme.dart';
import 'package:portfolio/widgets/custom_button.dart';
import 'package:portfolio/widgets/social_media.dart';

class MainComponentMobile extends StatefulWidget {
  final AdaptiveThemeMode adaptiveThemeMode;
  const MainComponentMobile({
    Key? key,
    required this.adaptiveThemeMode,
  }) : super(key: key);

  @override
  _MainComponentMobileState createState() => _MainComponentMobileState();
}

class _MainComponentMobileState extends State<MainComponentMobile> {
  bool _isDarkMode = false;
  final ScrollController _controller = ScrollController();
  bool _showBackToTopButton = false;

  final List<Widget> _widgets = [
    const BioComponentMobile(),
    const SkillComponentMobile(),
    const KnowMeComponentMobile(),
    const ProjectComponentMobile(),
    const AchivementComponentMobile(),
    const ContactMeComponentMobile(),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        if (_controller.offset >= 50) {
          _showBackToTopButton = true;
        } else {
          _showBackToTopButton = false;
        }
      });
    });
    _isDarkMode = widget.adaptiveThemeMode == AdaptiveThemeMode.dark;
  }

  @override
  void dispose() {
    _controller.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _animateToIndex(double _height) {
      _controller.animateTo(
        _height,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }

    final textTheme = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
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
      drawer: Drawer(
        backgroundColor: _isDarkMode ? Colors.black : Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              // color: _isDarkMode ? Colors.black : Colors.white,
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundColor: lightPurple,
                radius: 100,
                child: CircleAvatar(
                  child: ClipRRect(
                    child: Image.asset('assets/images/sahil_selfie.jpg'),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  radius: 95,
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/skills.png',
                width: 30,
                height: 30,
              ),
              title: Text(
                'Skills',
                style: textTheme.headline1,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                _animateToIndex(height * 1.56);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/project.png',
                width: 30,
                height: 30,
              ),
              title: Text(
                'Projects',
                style: textTheme.headline1,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                _animateToIndex(height * 4.1);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/medal.png',
                width: 30,
                height: 30,
              ),
              title: Text(
                'Achivements',
                style: textTheme.headline1,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                _animateToIndex(height * 5.45);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/contact.png',
                width: 30,
                height: 30,
              ),
              title: Text(
                'Contact Me',
                style: textTheme.headline1,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                _animateToIndex(height * 8.25);
              },
            ),
            const SizedBox(height: 20),
            const Center(
              child: CustomButton(
                text: 'SEE MY RESUME',
                isResume: true,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const SocialMediaContacts(
                hasResume: false,
                iconSize: 40,
                iconPadding: 0,
              ),
            )
          ],
        ),
      ),
      backgroundColor: _isDarkMode ? darkBackgroundColor : lightBackgroundColor,
      body: Scrollbar(
        showTrackOnHover: true,
        thickness: 10,
        controller: _controller,
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(
                color: _isDarkMode ? Colors.white : Colors.black,
              ),
              elevation: 10,
              floating: true,
              toolbarHeight: 80,
              centerTitle: true,
              backgroundColor: _isDarkMode ? darkBackgroundColor : lightBackgroundColor,
              title: Image.asset(
                "assets/images/signature.png",
                alignment: Alignment.center,
                width: 200,
                height: 200,
              ),
              actions: [
                IconButton(
                  padding: const EdgeInsets.only(right: 10),
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
                          size: 25,
                        )
                      : const Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.black,
                          size: 25,
                        ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _widgets[index];
                },
                childCount: _widgets.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
