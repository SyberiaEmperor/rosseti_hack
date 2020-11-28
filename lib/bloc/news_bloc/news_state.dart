import 'package:meta/meta.dart';
import 'package:rosseti/helpers/sortcases.dart';
import 'package:rosseti/models/registry_item.dart';

@immutable
abstract class NewsState {}

class InitialNewsState extends NewsState {
  final Direction direction;
  final int vertical;
  final SortVar sortVar;
  final List<RegistryItem> statements;

  InitialNewsState(
      {this.sortVar = SortVar.popularity,
      this.vertical = 1,
      this.statements,
      this.direction = Direction.all});
}

class LoadingState extends NewsState {
  final String caption;

  LoadingState(this.caption);
}
