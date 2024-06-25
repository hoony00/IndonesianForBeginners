import 'dart:convert';

import 'package:flutter/services.dart';

class Chapter {
  final String indonesian;
  final String korean;

  Chapter({required this.indonesian, required this.korean});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      indonesian: json['indonesian'],
      korean: json['korean'],
    );
  }
}


