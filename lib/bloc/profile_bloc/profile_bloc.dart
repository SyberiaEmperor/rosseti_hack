import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti/bloc/authenticated_bloc/authenticated_bloc.dart';

import 'package:rosseti/models/profile.dart';
import 'package:rosseti/repos/models/repository.dart';
import 'package:rosseti/repos/entities/profile_temp_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Repository<Profile> _profileRepository;
  final ProfileTempRepository _profileTempRepository;
  final AuthenticatedBloc _authenticatedBloc;
  StreamSubscription _authenticatedStreamSubscription;

  ProfileBloc(this._profileRepository, this._profileTempRepository, this._authenticatedBloc)
      : super(ProfileInitialState()) {
   // add(ProfileAuthenticatedEvent());
    _authenticatedStreamSubscription = _authenticatedBloc.listen((state) {
      if (state is SingInState) {
        add(ProfileAuthenticatedEvent());
      }
    });
  }

  @override
  Future<void> close() {
     _authenticatedStreamSubscription.cancel();
    return super.close();
  }

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileAuthenticatedEvent) {
      yield* _mapAuthenticatedEventToState();
    } else if (event is ProfileSaveChangesEvent) {
      yield* _mapSaveChangesEventToState();
    } else if (event is ProfileGeneralInfoSubmittedEvent) {}
  }

  Stream<ProfileState> _mapAuthenticatedEventToState() async* {
    yield ProfileLoadingState();
    try {
      final profile = await _profileRepository.getData();
      _profileTempRepository.getDataFromProfile(profile);
    } on Exception {
      yield ProfileErrorState("Ошибка получения данных");
    }
    yield ProfileRecivedSuccesfullyState();
  }

  Stream<ProfileState> _mapSaveChangesEventToState() async* {
    yield ProfileSavingState();
    try {
      await _profileRepository.persistData(_profileTempRepository.profile);
      yield ProfileSavedSuccessfullyState();
    } on Exception catch (e) {
      yield ProfileErrorState("Ошибка загрузки профиля");
    }
  }
}
