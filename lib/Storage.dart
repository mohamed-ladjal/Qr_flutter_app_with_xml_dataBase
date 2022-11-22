import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CounterStorage {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/contacts.xml");
  }

  static Future<String> readCounter() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "";
    }
  }

  static Future<File> writeCounter(String data) async {
    final file = await _localFile;
    return file.writeAsString(data);
  }

  static Future<String> getFilePath() async {
    final file = await _localFile;
    return file.path;
  }
}
