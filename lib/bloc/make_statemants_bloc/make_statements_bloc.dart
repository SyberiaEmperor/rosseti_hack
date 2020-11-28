import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'make_statements_event.dart';
part 'make_statements_state.dart';

enum TypeOfIncident {
  faceToFace,
  internet,
  notChanged,
}

class MakeStatementsBloc
    extends Bloc<MakeStatementsEvent, MakeStatementsState> {
  MakeStatementsBloc() : super(TypeOfIncidentChoiceState(-1));

  TypeOfIncident _typeOfIncident;
  int _step = -1;
  int max = 4;

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
