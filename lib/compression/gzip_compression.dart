import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main(){

  String data = '';
  for(int i = 0; i<100; i++){
      data = data + 'Hello World\r\n';
  }

//  Original data
  List original = utf8.encode(data);

//  compress data
  List compressed = gzip.encode(original);

//  Decompress
  List decompress = gzip.decode(compressed);
  
  print('Original ${original.length} bytes');
  print('Compressed ${compressed.length} bytes');
  print('Decompressed ${decompress.length} bytes');

  String decoded = utf8.decode(decompress);
  assert (data == decoded);

  print(decoded);
}