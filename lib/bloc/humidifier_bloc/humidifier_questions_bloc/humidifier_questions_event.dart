part of 'humidifier_questions_bloc.dart';

abstract class HumidifierQuestionsBlocEvent extends Equatable {
  const HumidifierQuestionsBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchQuestion extends HumidifierQuestionsBlocEvent {
  final int patientId;

  FetchQuestion({@required this.patientId});

  @override
  List<Object> get props => [patientId];
}

class AddAnswer extends HumidifierQuestionsBlocEvent {
  final Questions question;
  final int index;

  AddAnswer({@required this.question, @required this.index});

  @override
  List<Object> get props => [question, index];
}

class ValidateSurvey extends HumidifierQuestionsBlocEvent {}

class RefuseSurvey extends HumidifierQuestionsBlocEvent {}
