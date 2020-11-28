part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object> get props => [];
}

class ProfileAuthenticatedEvent extends ApplicationEvent{}

class ProfileSaveChangesEvent extends ApplicationEvent{}

class ProfileGeneralInfoSubmittedEvent extends ApplicationEvent{}




