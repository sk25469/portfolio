import 'dart:ui';

class Project {
  final String title;
  final String description;
  final int size;
  final String language;
  final Color languageColor;
  final String projectUrl;

  Project({
    required this.title,
    required this.description,
    required this.size,
    required this.language,
    required this.languageColor,
    required this.projectUrl,
  });
}
