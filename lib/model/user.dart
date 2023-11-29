import 'dart:convert';
import 'package:image_picker/image_picker.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String id;
  String name;
  double totalhours;
  XFile? image;
  User({
    required this.id,
    required this.name,
    required this.totalhours,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'totalhours': totalhours,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      totalhours: map['totalhours'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
