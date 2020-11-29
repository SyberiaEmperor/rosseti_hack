import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rosseti/helpers/requests/requests.dart';
import 'package:rosseti/helpers/sortcases.dart';
import 'package:rosseti/models/registry.dart';
import 'package:rosseti/models/registry_item.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(NewsState initialState) : super(initialState) {
    sortFunc = sortVar.comparator;
    registry = Registry();
  }

  Registry registry;
  Direction currentDirection = Direction.all;
  SortVar sortVar = SortVar.popularity;
  Function sortFunc;
  int vertic = -1;
  List<RegistryItem> reOrderStatemets(List<RegistryItem> states) {
    states.sort(sortFunc);
    if (vertic < 0) states = states.reversed.toList();
    return states;
  }

  void changeParams(SelectSort event) {
    sortVar = event.sortVar;
    vertic = event.vertical;
    sortFunc = sortVar.comparator;
  }

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is Update) {
      yield LoadingState("");
      registry.statements = [];

      registry.statements = await getStatements(event.profile);

      yield InitialNewsState(
          direction: currentDirection,
          statements: currentDirection == Direction.all
              ? registry.statements
              : registry.statements
                  .where((element) => element.direction == currentDirection)
                  .toList());
    }
    if (event is SelectDirection) {
      yield LoadingState("");
      currentDirection = event.direction;
      yield InitialNewsState(
          direction: currentDirection,
          statements: currentDirection == Direction.all
              ? registry.statements
              : registry.statements
                  .where((element) => element.direction == currentDirection)
                  .toList());
    }
    if (event is SelectSort) {
      yield LoadingState("");
      changeParams(event);
      registry.statements = reOrderStatemets(registry.statements);
      yield InitialNewsState(
          direction: currentDirection, statements: registry.statements);
    }
    if (event is Search) {
      yield LoadingState("");
      currentDirection = Direction.all;
      var states = searchStrings(event.search, registry.statements);
      states = reOrderStatemets(states);
      yield InitialNewsState(
          direction: currentDirection,
          sortVar: sortVar,
          vertical: vertic,
          statements: states);
    }
  }
}

List<RegistryItem> searchStrings(String query, List<RegistryItem> states) {
  List<RegistryItem> newItems = [];

  for (var str in query.split(" ")) {
    for (var state in states) {
      if (!newItems.contains(state)) {
        if (state.status.asString.contains(str))
          newItems.add(state);
        else if (state.direction.asString.contains(str))
          newItems.add(state);
        else if (state.title.contains(str))
          newItems.add(state);
        else if (state.currentStateDes.contains(str))
          newItems.add(state);
        else if (state.ideaStateDes.contains(str))
          newItems.add(state);
        else if (state.predictedStateDes.contains(str)) newItems.add(state);
      }
    }
  }

  return newItems;
}
