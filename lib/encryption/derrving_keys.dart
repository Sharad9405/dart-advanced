import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/pointycastle.dart';

void main(){

  final password = 'password';

  final salt = _createUint8ListFromString('salt');  
  /*
  * eg. you and your friend using same algorithm with same key that will generate same key. 
  * that's not good that's why 'salt' randomises little bit
  * same thing different salt
  * key for the key for initializer
  * */
  
  
  
  final pkcs = KeyDerivator('SHA-1/HMAC/PBKDF2');   
  // algorithm doing some chaining, you don't need to know much about this, you just need to know to push it algorithm  
  
  final params = Pbkdf2Parameters(salt, 100, 16);
  // 100 - iterations count
  // 16 - desired block  size (if use different might be causing issue)
  
  
  pkcs.init(params);

  final key = pkcs.process(_createUint8ListFromString(password));
  
  _displayUint8List('key value', key);

}

// unsigned integer 8 bit
Uint8List _createUint8ListFromString(String value){
  return Uint8List.fromList(utf8.encode(value));
}

void _displayUint8List(String title, Uint8List value){
  print(title);
  print(value);
  print(base64.encode(value));
  print('');
}