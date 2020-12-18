import 'dart:io';

void main(){
  // current os & version
  print('OS = ${Platform.operatingSystem} , version = ${Platform.version}');

//  check platform
  if(Platform.isLinux){
    print('Linux code');
  }else{
    print('normal code');
  }
  // get executing path/actual file running
  print('path = ${Platform.script.path}');
//  check from where dart is working
  print('dart = ${Platform.executable}');
  
  print('Environment variable');
  Platform.environment.keys.forEach((key) {
    print('$key : ${Platform.environment[key]}');
  });





}