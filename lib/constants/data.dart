import 'package:flutter/material.dart';
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
