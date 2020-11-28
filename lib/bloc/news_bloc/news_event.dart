import 'package:meta/meta.dart';
import 'package:rosseti/helpers/sortcases.dart';
import 'package:rosseti/models/registry_item.dart';

@immutable
abstract class NewsEvent {}

class Update extends NewsEvent {}

class Search extends NewsEvent {
  final String search;

  Search(this.search);
}

class SelectDirection extends NewsEvent {
  final Direction direction;

  SelectDirection(this.direction);
}

class SelectSort extends NewsEvent {
  final int vertical;
  final SortVar sortVar;

  SelectSort(this.vertical, this.sortVar);
}
