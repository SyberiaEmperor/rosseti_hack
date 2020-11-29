import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti/models/registry_item.dart';
import 'package:rosseti/helpers/requests/requests.dart' as requests;

part 'suggestion_page_event.dart';
part 'suggestion_page_state.dart';

class SuggestionPageBloc
    extends Bloc<SuggestionPageEvent, SuggestionPageState> {
  final RegistryItem item;
  SuggestionPageBloc(this.item) : super(SuggestionPageInitial(item));

  @override
  Stream<SuggestionPageState> mapEventToState(
    SuggestionPageEvent event,
  ) async* {
    if (state is LikeEvent) {
      item.liked();
      requests.like(item.id);
      yield SuggestionPageInitial(item);
    }
    if (state is DislikeEvent) {
      item.disliked();
      requests.dislike(item.id);
      yield SuggestionPageInitial(item);
    }
  }
}
