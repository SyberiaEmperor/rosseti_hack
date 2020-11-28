part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileAuthenticatedEvent extends ProfileEvent{}

class ProfileSaveChangesEvent extends ProfileEvent{}

class ProfileGeneralInfoSubmittedEvent extends ProfileEvent{}




