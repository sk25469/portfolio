import 'dart:convert';
import 'dart:ui';

class Project {
  final String title;
  final String description;
  final int size;
  final String language;
  final Color languageColor;

  Project({
    required this.title,
    required this.description,
    required this.size,
    required this.language,
    required this.languageColor,
  });

  Project copyWith({
    String? title,
    String? description,
    int? size,
    String? language,
    Color? languageColor,
  }) {
    return Project(
      title: title ?? this.title,
      description: description ?? this.description,
      size: size ?? this.size,
      language: language ?? this.language,
      languageColor: languageColor ?? this.languageColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'size': size,
      'language': language,
      'languageColor': languageColor.value,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      size: map['size']?.toInt() ?? 0,
      language: map['language'] ?? '',
      languageColor: Color(map['languageColor']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) => Project.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Project(title: $title, description: $description, size: $size, language: $language, languageColor: $languageColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Project &&
        other.title == title &&
        other.description == description &&
        other.size == size &&
        other.language == language &&
        other.languageColor == languageColor;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        size.hashCode ^
        language.hashCode ^
        languageColor.hashCode;
  }
}
