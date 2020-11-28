part of 'make_statements_bloc.dart';

abstract class MakeStatementsState extends Equatable {
  const MakeStatementsState(this.step);
  final int step;

  @override
  List<Object> get props => [step];
}

class TypeOfIncidentChoiceState extends MakeStatementsState {
  TypeOfIncidentChoiceState(int step) : super(step);
}

class InternetStepState extends MakeStatementsState {
  InternetStepState(int step) : super(step);
}

class FaceToFaceStepState extends MakeStatementsState {
  FaceToFaceStepState(int step) : super(step);
}
