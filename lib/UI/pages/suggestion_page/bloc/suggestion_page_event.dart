part of 'suggestion_page_bloc.dart';

abstract class SuggestionPageEvent extends Equatable {
  const SuggestionPageEvent();

  @override
  List<Object> get props => [];
}

class LikeEvent extends SuggestionPageEvent {}

class DislikeEvent extends SuggestionPageEvent {}
