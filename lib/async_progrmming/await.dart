import 'dart:io';
import 'dart:async';

void main() async{

  print('Starting ');
  File file =  await appendFile();
  
  print('Appended to file ${file.path}');

  print('*****End*****');
}

 Future<File> appendFile(){
  File file = File(Directory.current.path + '/test.txt');
  var dt = DateTime.now();
  return file.writeAsString(dt.toString() + '\r\n', mode: FileMode.append);

}