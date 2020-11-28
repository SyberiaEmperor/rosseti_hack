part of 'repository.dart';

abstract class FileRepository {
  
  Future<String> persistFile(String key, Uint8List file);
  Future<Uint8List> getFile(String key);
  Future<void> deleteFile(String key);
  String  currentUrl(String key);
  Uint8List  currentFile(String key);
  void addStartedFilename(String key,String filename, String type, {bool sendImmediately});  
  void clear();
}
