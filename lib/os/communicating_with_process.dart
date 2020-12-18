import 'dart:io';
import 'dart:convert';

void main() {
  // linux specific
  Process.start('cat', []).then((Process process) {

    // transform the output
    process.stdout.transform(utf8.decoder).listen((data) {
      print(data);

      //  send to the process
      process.stdin.writeln('Hello world');

      //  stop the process
      Process.killPid(process.pid);

      //  get the exit code
      process.exitCode.then((int code) {
        print(code);

        //  exit
        exit(0);
      });
    });
  });
}
