part of 'humidifier_questions_bloc.dart';

abstract class HumidifierQuestionsState extends Equatable {
  const HumidifierQuestionsState();

  @override
  List<Object> get props => [];
}

class HumidifierQuestionsEmpty extends HumidifierQuestionsState {}

class HumidifierQuestionsError extends HumidifierQuestionsState {}

class HumidifierQuestionsLoading extends HumidifierQuestionsState {}

class HumidifierQuestionsLoaded extends HumidifierQuestionsState {
  final int patientId;
  final HumidifierSurveyQuestion survey;
  final DateTime beginDate;
  final List<Questions> questions;

  HumidifierQuestionsLoaded(
      {@required this.patientId,
      @required this.survey,
      @required this.beginDate,
      @required this.questions});

  @override
  List<Object> get props => [patientId, survey, beginDate, questions];
}

class HumidifierQuestionValidate extends HumidifierQuestionsState {}

class HumidifierQuestionRefuse extends HumidifierQuestionsState {}
