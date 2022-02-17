import 'package:flutter/material.dart';
import 'package:portfolio/model/company_model.dart';
import 'package:portfolio/model/project_model.dart';

class ProjectData {
  static final projectList = [
    Project(
      title: 'library-tracking-system',
      description:
          'An API made using Spring Boot and Postgres which contains the database of different books, their availability count, the location in a library',
      size: 63,
      language: 'Java',
      languageColor: Colors.orange,
    ),
    Project(
      title: 'shop-app',
      description:
          'Flutter UI kit for an online shop for food, groceries, and medicine. The user can order, add to the cart, and checkout',
      size: 1483,
      language: 'Dart',
      languageColor: Colors.blue,
    ),
    Project(
      title: 'social-media-demo',
      description:
          'Social Media application using Firebase as a backend and service. User can share pics with a 100 characters based caption',
      size: 273,
      language: 'Dart',
      languageColor: Colors.blue,
    ),
    Project(
      title: 'codeforces-visualizer',
      description:
          'A flutter app to remind users of the upcoming contests on codeforces, and to show the user details of their codeforces profile',
      size: 199423,
      language: 'Dart',
      languageColor: Colors.blue,
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

  static get amet => null;
}
