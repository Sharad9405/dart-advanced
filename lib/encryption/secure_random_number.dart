import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
import 'package:pointycastle/pointycastle.dart';


void main(){

  print(_randomBytes(8));
  //ex [136, 254, 20, 48, 67, 233, 162, 91]

  print(_randomBytes(16));  // will generate the byte of length input
//  ex [223, 251, 60, 221, 31, 151, 60, 106, 14, 129, 10, 207, 125, 215, 19, 28]
}

Uint8List _randomBytes(int length){

  final rnd = SecureRandom("AES/CTR/AUTO-SEED-PRNG"); //algorithm

  final key = Uint8List(16);  // block size
  final keyParam = KeyParameter(key);
  final param = ParametersWithIV(keyParam, Uint8List(16));

  rnd.seed(param);

  final random = Random();

  for(int i = 0; i < random.nextInt(255); i++){
    rnd.nextUint8();
  }

  final bytes = rnd.nextBytes(length);

  return bytes;

}