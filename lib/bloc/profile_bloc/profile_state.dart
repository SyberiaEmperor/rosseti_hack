part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSavingState extends ProfileState {}

class ProfileRecivedSuccesfullyState extends ProfileState {}

//class ProfileRecivedWithErrorState extends ProfileState {}

class ProfileSavedSuccessfullyState extends ProfileState {
} //?	class ProfileSavedSuccessfully extends ProfileState {} //?

class NameFocusState extends ProfileState {}

class SurnameFocusState extends ProfileState {}

class FathernameFocusState extends ProfileState {}

class EmailFocusState extends ProfileState {}

class MainPageFocusState extends ProfileState {}

class RegisterPageFocusState extends ProfileState {}

class IncorrectEmailState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String errorText;
  ProfileErrorState(this.errorText);
  @override
  List<Object> get props => [errorText];
}
