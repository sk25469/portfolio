import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/mobile/bio_component_mobile.dart';
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
  final List<Widget> _widgets = [
    const BioComponentMobile(),
    const SkillComponentMobile(),
    // AboutComponentMobile(),
    // ProjectsComponentMobile(),
    // ContactComponentMobile(),
  ];

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.adaptiveThemeMode == AdaptiveThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: _isDarkMode ? Colors.black : Colors.white,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
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
      body: CustomScrollView(
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
    );
  }
}
