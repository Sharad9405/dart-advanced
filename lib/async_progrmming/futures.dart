import 'dart:io';
import 'dart:async';

void main(){

  String path = Directory.current.path + '/test.txt';
  print('Appending to $path');

  File file = File(path);

  // Future is a promise, that you can get a return a future, when ready will return an object, not right know but we can wait
  Future<RandomAccessFile> f = file.open(mode: FileMode.append);

  f.then((RandomAccessFile raf){
    print('File has been opened');
    
    raf.writeString('Hello World').then((value){
      print('File has been appended');
    }).catchError((onError){
      print('An error occurred ');
    }).whenComplete(() => raf.close());
  });

  print('***** The End *****');

}