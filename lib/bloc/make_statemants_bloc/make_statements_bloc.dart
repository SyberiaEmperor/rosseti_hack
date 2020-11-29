import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti/helpers/requests/requests.dart';
import 'package:rosseti/models/registry_item.dart';

import '../../repos/entities/application_temp_repository.dart';
import '../../repos/entities/application_temp_repository.dart';

part 'make_statements_event.dart';
part 'make_statements_state.dart';

enum TypeOfIncident {
  faceToFace,
  internet,
  notChanged,
}

class MakeStatementsBloc
    extends Bloc<MakeStatementsEvent, MakeStatementsState> {
  MakeStatementsBloc() : super(TypeOfIncidentChoiceState(-1)) {
    ApplicationTempRepository().uploadData();
  }

  TypeOfIncident _typeOfIncident;
  int _step = 0;
  int max = 10;
  ApplicationTempRepository repos = ApplicationTempRepository();

  int get step => _step;
  TypeOfIncident get curTypeOfIncident => _typeOfIncident;

  @override
  Stream<MakeStatementsState> mapEventToState(
    MakeStatementsEvent event,
  ) async* {
    if (event is SetTypeOfIncident) {
      _typeOfIncident = event.typeOfIncident;
      _step = 0;
      yield _typeOfIncident == TypeOfIncident.internet
          ? InternetStepState(0)
          : FaceToFaceStepState(0);
    } else if (event is InternetStepEvent) {
       _step = event.step;
      if (_step == 4) {
        final Map<String, dynamic> uniqueInform = await getUniqueness(
          ApplicationTempRepository().problem,
          ApplicationTempRepository().title,
        );
        if (uniqueInform['uniqueness'] != 100) {
          List<RegistryItem> items = [];
          (uniqueInform['similars'] as List).forEach((element) {
            items.add(RegistryItem.fromData(element,0));
          });
          yield InternetStepState(_step);
          yield InformState(step,uniqueInform['uniqueness'], items);
          return;
        } else{
          yield InternetStepState(_step);
          yield InformState(step,uniqueInform['uniqueness'], []);
        }
      }
      ApplicationTempRepository().persistData();
     
      if (_step == 10) {
        if (await ApplicationTempRepository().sendToServer()) {
          yield _step >= 0
              ? InternetStepState(_step)
              : TypeOfIncidentChoiceState(_step);
        } else
          yield ErrorState(_step);
      }
      yield _step >= 0
          ? InternetStepState(_step)
          : TypeOfIncidentChoiceState(_step);
    } else if (event is FaceToFaceStepEvent) {
      _step = event.step;
      yield _step >= 0
          ? FaceToFaceStepState(_step)
          : TypeOfIncidentChoiceState(_step);
    }
  }
}
