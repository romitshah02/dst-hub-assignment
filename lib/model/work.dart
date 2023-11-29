// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Work {
  final String id;
  final String title;
  final double time;

  Work({required this.title, required this.time}) : id = uuid.v4();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'time': time,
    };
  }

  factory Work.fromMap(Map<String, dynamic> map) {
    return Work(
      title: map['title'] as String,
      time: map['time'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Work.fromJson(String source) =>
      Work.fromMap(json.decode(source) as Map<String, dynamic>);
}
