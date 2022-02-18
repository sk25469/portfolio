import 'dart:convert';

class Achievement {
  final String name;
  final String description;
  final String assetName;
  Achievement({
    required this.name,
    required this.description,
    required this.assetName,
  });

  Achievement copyWith({
    String? name,
    String? description,
    String? assetName,
  }) {
    return Achievement(
      name: name ?? this.name,
      description: description ?? this.description,
      assetName: assetName ?? this.assetName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'assetName': assetName,
    };
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      assetName: map['assetName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Achievement.fromJson(String source) => Achievement.fromMap(json.decode(source));

  @override
  String toString() =>
      'Achievement(name: $name, description: $description, assetName: $assetName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Achievement &&
        other.name == name &&
        other.description == description &&
        other.assetName == assetName;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ assetName.hashCode;
}
