import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Company {
  final String name;
  final String description;
  final List<Color> colors;
  final String imageAssetPath;
  final String designation;
  final String startDate;
  final String endDate;

  Company({
    required this.name,
    required this.description,
    required this.colors,
    required this.imageAssetPath,
    required this.designation,
    required this.startDate,
    required this.endDate,
  });

  Company copyWith({
    String? name,
    String? description,
    List<Color>? colors,
    String? imageAssetPath,
    String? designation,
    String? startDate,
    String? endDate,
  }) {
    return Company(
      name: name ?? this.name,
      description: description ?? this.description,
      colors: colors ?? this.colors,
      imageAssetPath: imageAssetPath ?? this.imageAssetPath,
      designation: designation ?? this.designation,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'colors': colors.map((x) => x.value).toList(),
      'imageAssetPath': imageAssetPath,
      'designation': designation,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      colors: List<Color>.from(map['colors']?.map((x) => Color(x))),
      imageAssetPath: map['imageAssetPath'] ?? '',
      designation: map['designation'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) => Company.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Company(name: $name, description: $description, colors: $colors, imageAssetPath: $imageAssetPath, designation: $designation, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Company &&
        other.name == name &&
        other.description == description &&
        listEquals(other.colors, colors) &&
        other.imageAssetPath == imageAssetPath &&
        other.designation == designation &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        colors.hashCode ^
        imageAssetPath.hashCode ^
        designation.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
