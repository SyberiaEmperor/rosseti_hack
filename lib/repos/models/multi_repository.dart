part of 'repository.dart';

abstract class MultiRepository<T>{
   List<T> currentData;
   void add(T element);
   List<T> getAllData();
}