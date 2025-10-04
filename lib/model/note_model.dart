import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final DateTime createdAt;
  final String description;
  final int? id;
  final String headline;

  NoteModel({
    required this.createdAt,
    required this.description,
    this.id,
    required this.headline,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.now(), // fallback لو createdAt null
      description: json['description'] ?? '',
      id: json['id'] as int?,
      headline: json['headline'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': Timestamp.fromDate(createdAt),
      'description': description,
      'id': id,
      'headline': headline,
    };
  }
}
