import 'package:flutter/material.dart';
import 'package:portfolio/model/achievement_model.dart';
import 'package:portfolio/model/company_model.dart';
import 'package:portfolio/model/project_model.dart';

class ProjectData {
  static final projectList = [
    Project(
      title: 'library-tracking-system',
      description:
          'An API made using Spring Boot and Postgres for displaying the locations and count in the library',
      size: 63,
      language: 'Java',
      languageColor: Colors.orange,
      projectUrl: 'https://github.com/sk25469/library_tracking_sys',
    ),
    Project(
      title: 'shop-app',
      description:
          'Flutter UI kit for an online shop for food, groceries, and medicine. The user can order, add to the cart, and checkout',
      size: 1483,
      language: 'Dart',
      languageColor: Colors.blue,
      projectUrl: 'https://github.com/sk25469/shop-app',
    ),
    Project(
      title: 'social-media-demo',
      description:
          'Social Media application using Firebase as a backend and service. User can share pics with a 100 characters based caption',
      size: 273,
      language: 'Dart',
      languageColor: Colors.blue,
      projectUrl: 'https://github.com/sk25469/social-media-demo',
    ),
    Project(
      title: 'codeforces-visualizer',
      description:
          'A flutter app to remind users of the upcoming contests on codeforces, and to show the user details of their codeforces profile',
      size: 199423,
      language: 'Dart',
      languageColor: Colors.blue,
      projectUrl: 'https://github.com/sk25469/codeforces_visualizer',
    ),
  ];
}

class CompanyData {
  static final company = [
    Company(
      name: 'Google',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua\n\n⚡Flutter is Google’s UI toolkit for crafting beautiful, high-fidelity\n⚡Natively compiled applications for mobile, web, and desktop from a single codebase.',
      colors: [
        const Color.fromRGBO(234, 67, 53, 1),
        const Color.fromRGBO(66, 133, 244, 1),
        const Color.fromRGBO(52, 168, 83, 1),
        const Color.fromRGBO(251, 188, 5, 1),
      ],
      imageAssetPath: 'assets/icons/google.png',
      designation: 'Software Engineer',
      startDate: 'Jan 2021',
      endDate: 'Present',
    ),
    Company(
      name: 'Facebook',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua\n\n⚡Flutter is Google’s UI toolkit for crafting beautiful, high-fidelity\n⚡Natively compiled applications for mobile, web, and desktop from a single codebase.',
      colors: [
        const Color.fromRGBO(24, 119, 242, 1),
      ],
      imageAssetPath: 'assets/icons/facebook.png',
      designation: 'Software Developer',
      startDate: 'Jan 2020',
      endDate: 'Dec 2020',
    ),
  ];
}

class AchievementsData {
  static final achievements = [
    Achievement(
      name: 'Google Kickstart 2021',
      description: 'Ranked 1912 in Google Kickstart 2021 Round - H',
      assetName: 'assets/images/kickstart.png',
      certificateUrl:
          'https://drive.google.com/file/d/10plH5Au0I0J99M6Vlgpf8XYZWleHikoi/view?usp=sharing',
    ),
    Achievement(
      name: 'Google CodeJam 2021',
      description: 'Qualified for the 2nd round of Google CodeJam by scoring 30 points',
      assetName: 'assets/images/codejam.png',
      certificateUrl:
          'https://drive.google.com/file/d/10rFFJo7j0QXRQpmkf-IJGKacygZ-AacV/view?usp=sharing',
    ),
    Achievement(
      name: 'Intro to Quantum Computing',
      description:
          'I was one of the 7000 students around the globe to be a part of this Introduction to Quantum Computing course offered by IBM and The Coding School',
      assetName: 'assets/images/coding_school.png',
      certificateUrl:
          'https://drive.google.com/file/d/1-rxj1yw9xrASxqYkqAaFAhd-qKsToJC-/view?usp=sharing',
    ),
    Achievement(
      name: 'Intro to Graph Algorithms - Coursera',
      description:
          'Took a course on Data structures and Graph Algorithms from Coursera.com.',
      assetName: 'assets/images/coursera.png',
      certificateUrl:
          'https://www.coursera.org/account/accomplishments/certificate/L3FNVYVYCW38',
    ),
  ];
}
