import 'dart:convert';
import 'dart:io';

void main(){

  int _zlib = _testCompress(zlib);
  int _gzip = _testCompress(gzip);

  print('zlib = $_zlib');  // 68
  print('gzip = $_gzip');  // 80


//  zlib is best for compression ration
//  gzip is faster than zlib
}

String generateData(){
  String data = '';
  for(int i=0;i<1000; i++){
    data = data + 'Hello World\r\n';
  }
  return data;
}

int _testCompress(var codec){
  String data = generateData();

  List original = utf8.encode(data);
  List compressed = codec.encode(original);
  List decompressed = codec.decode(compressed);
  
  print('Testing ${codec.toString()}');
  print('Original ${original.length}');
  print('Compressed ${compressed.length}');
  print('Decompressed ${decompressed.length}');
  print('');

  try{
    String decoded = utf8.decode(compressed);
    assert(data == decoded);
  }catch(e){
    stderr.write('\nError $e\n');
    // print('Error $e');
  }

  return compressed.length;
}