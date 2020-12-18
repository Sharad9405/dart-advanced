import 'dart:io';

void main(){
  // list all files in a directory - linux specific
  Process.run('ls', ['-l']).then((ProcessResult result) {
      print(result.stdout);
      print('Exit code ${result.exitCode}');  // 0 is normal
  });
}