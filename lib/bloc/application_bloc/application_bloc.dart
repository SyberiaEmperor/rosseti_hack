import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti/bloc/authenticated_bloc/authenticated_bloc.dart';
import 'package:rosseti/models/profile.dart';
import 'package:rosseti/repos/models/repository.dart';
import 'package:rosseti/repos/entities/application_temp_repository.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final Repository<Profile> _profileRepository;
  final ApplicationTempRepository _applicationTempRepository;
  final FileRepository _fileRepository;
  final AuthenticatedBloc _authenticatedBloc;
  StreamSubscription _authenticatedStreamSubscription;

  ApplicationBloc(this._profileRepository, this._applicationTempRepository,
      this._fileRepository, this._authenticatedBloc)
      : super(ProfileInitialState()) {
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
  Stream<ApplicationState> mapEventToState(
    ApplicationEvent event,
  ) async* {
    if (event is ProfileAuthenticatedEvent) {
      yield* _mapAuthenticatedEventToState();
    } else if (event is ProfileSaveChangesEvent) {
      yield* _mapSaveChangesEventToState();
    } else if (event is ProfileGeneralInfoSubmittedEvent) {

    }
  }

  Stream<ApplicationState> _mapAuthenticatedEventToState() async* {
    yield ProfileLoadingState();
    try {
      final profile=await _profileRepository.getData();
      
     
  
      
      
    } on Exception {
      yield ProfileErrorState("Ошибка получения данных");
    }
    yield ProfileRecivedSuccesfullyState();
  }


  Stream<ApplicationState> _mapSaveChangesEventToState() async* {
    yield ProfileLoadingState();
    
    
  }
}
