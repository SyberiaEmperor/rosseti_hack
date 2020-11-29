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

class ErrorState extends MakeStatementsState {
  ErrorState(int step) : super(step);
}

class InformState extends MakeStatementsState{
  final int percent;
  final List<RegistryItem> items;
  InformState(int step, this.percent, this.items) : super(step);
}

class InternetStepState extends MakeStatementsState {
  InternetStepState(int step) : super(step);
}

class FaceToFaceStepState extends MakeStatementsState {
  FaceToFaceStepState(int step) : super(step);
}
