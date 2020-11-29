part of 'suggestion_page_bloc.dart';

abstract class SuggestionPageState extends Equatable {
  const SuggestionPageState();

  @override
  List<Object> get props => [];
}

class SuggestionPageInitial extends SuggestionPageState {
  final RegistryItem item;

  SuggestionPageInitial(this.item);
  @override
  List<Object> get props => [item];
}
