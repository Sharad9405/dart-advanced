import 'dart:async';

int counter = 0;
void main(){

  Duration duration = Duration(seconds: 1);
  Timer.periodic(duration, timeOut);

  print('Started ${getTime()}');

}

void timeOut(Timer timer){
  print('Timeout: ${getTime()}');

  counter++;
  if(counter >= 5) timer.cancel();
}

String getTime(){
  DateTime dt = DateTime.now();
  return dt.toString();
}