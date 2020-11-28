import 'dart:typed_data';
part 'exceptions.dart';
part 'multi_repository.dart';
part 'file_repository.dart';
part 'authentication_repository.dart';

abstract class Repository<T> {
  T get currentData;
  Future<T> getData();
  Future<void> persistData(T data);
  void clear();
}
