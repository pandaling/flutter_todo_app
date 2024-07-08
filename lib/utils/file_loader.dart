import 'dart:convert';

import 'package:flutter/services.dart';

abstract class FileLoaderInterface {}

class FileLoader implements FileLoaderInterface {
  static Future<Map<String, dynamic>> from(String path) async {
    String contents = await rootBundle.loadString(path);
    Map<String, dynamic> envAsMap = json.decode(contents);
    return envAsMap;
  }
}
