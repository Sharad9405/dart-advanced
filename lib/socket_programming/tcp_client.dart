import 'dart:io';


void main() async{

  var socket = await Socket.connect('127.0.0.1', 3000);
  print('Connected');
  socket.write('Hello World');
  print('Sent, Closing');
  await socket.close();
  print('Closed');
  exit(0);
}