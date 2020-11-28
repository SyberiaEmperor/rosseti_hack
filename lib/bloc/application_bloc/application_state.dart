part of 'application_bloc.dart';

abstract class ApplicationState extends Equatable {
  const ApplicationState();

  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ApplicationState {}

class ProfileLoadingState extends ApplicationState {}

class ProfileSavingState extends ApplicationState {}

class ProfileRecivedSuccesfullyState extends ApplicationState {}

class ProfileSavedSuccessfullyState extends ApplicationState {
} //?	class ProfileSavedSuccessfully extends ProfileState {} //?

class NameFocusState extends ApplicationState {}

class SurnameFocusState extends ApplicationState {}

class FathernameFocusState extends ApplicationState {}

class EmailFocusState extends ApplicationState {}

class MainPageFocusState extends ApplicationState {}

class RegisterPageFocusState extends ApplicationState {}

class IncorrectEmailState extends ApplicationState {}

class ProfileErrorState extends ApplicationState {
  final String errorText;
  ProfileErrorState(this.errorText);
  @override
  List<Object> get props => [errorText];
}
