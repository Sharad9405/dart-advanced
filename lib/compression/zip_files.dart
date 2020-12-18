import 'dart:io';
import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as p;

void main(){

  List files = List<String>();
  Directory.current.listSync().forEach((FileSystemEntity fse) {
    if(fse.statSync().type == FileSystemEntityType.file) files.add(fse.path);
  });

  String zipFile = '/home/neosoft/workspace/test/test.zip';

  zip(files, zipFile);

  unZip(zipFile, '/home/neosoft/workspace/test/decompressed');

}

void zip(List<String> files, String file){

  Archive archive = Archive();

  files.forEach((String path) {
      File file = File(path);
      ArchiveFile archiveFile = ArchiveFile(p.basename(path), file.lengthSync(), file.readAsBytesSync());
      archive.addFile(archiveFile);
  });

  ZipEncoder encoder = ZipEncoder();
  File f = File(file);
  f.writeAsBytesSync(encoder.encode(archive));

  print('Compressed');

}

void unZip(String zip, String path){

  File file = File(zip);

  Archive archive = ZipDecoder().decodeBytes(file.readAsBytesSync());

  archive.forEach((ArchiveFile archiveFile) {
      File file = File(path + '/' + archiveFile.name);
      file.createSync(recursive: true);
      file.writeAsBytesSync(archiveFile.content);
  });
  print('Decompressed');
}
