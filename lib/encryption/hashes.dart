import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/pointycastle.dart';

void main(){

  final digest = Digest('SHA-256');

  final value = 'Hello World';

  final data = Uint8List.fromList(utf8.encode(value));
  final hash = digest.process(data);

  print(hash);
  print(base64.encode(hash));  // encoding is not encryption

}