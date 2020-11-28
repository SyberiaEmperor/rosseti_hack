part of 'make_statements_bloc.dart';

abstract class MakeStatementsEvent extends Equatable {
  const MakeStatementsEvent();

  @override
  List<Object> get props => [];
}


class SetTypeOfIncident extends MakeStatementsEvent {
  final TypeOfIncident typeOfIncident;
  SetTypeOfIncident(this.typeOfIncident);
  @override
  List<Object> get props => [typeOfIncident];
}


class InternetStepEvent extends MakeStatementsEvent {
  final int step;

  InternetStepEvent(this.step);
  
  @override
  List<Object> get props => [step];
}

class FaceToFaceStepEvent extends MakeStatementsEvent {
  final int step;

  FaceToFaceStepEvent(this.step);
  
  @override
  List<Object> get props => [step];
}

