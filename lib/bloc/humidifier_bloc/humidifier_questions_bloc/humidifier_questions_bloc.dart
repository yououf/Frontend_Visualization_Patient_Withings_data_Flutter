import 'dart:async';

import 'package:DIH4CPS_APP/models/humidifier_quiz.dart';
import 'package:DIH4CPS_APP/services/humidifier_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'humidifier_questions_event.dart';
part 'humidifier_questions_state.dart';

class HumidifierQuestionsBloc
    extends Bloc<HumidifierQuestionsBlocEvent, HumidifierQuestionsState> {
  final HumidifierRepository repository;

  HumidifierQuestionsBloc({@required this.repository})
      : super(HumidifierQuestionsEmpty());

  @override
  Stream<HumidifierQuestionsState> mapEventToState(
    HumidifierQuestionsBlocEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchQuestion) {
      yield HumidifierQuestionsLoading();
      try {
        List<HumidifierSurveyQuestion> humidifierSurvey =
            await repository.fetchAllQuestions();
        yield HumidifierQuestionsLoaded(
            questions: new List<Questions>(),
            patientId: event.patientId,
            survey: humidifierSurvey[0],
            beginDate: DateTime.now());
      } catch (e) {
        yield HumidifierQuestionsError();
      }
    }
    if (event is AddAnswer) {
      if (currentState is HumidifierQuestionsLoaded) {
        List<Questions> questions = currentState.questions;

        HumidifierSurveyQuestion humidifierSurveyQuestion = currentState.survey;

        if (questions.contains(event.question)) {
          // We verify if the question has not been already answered

          questions.remove(event.question);
        } else {
          questions.removeWhere((question) =>
              event.question.informationsQuestion ==
              question
                  .informationsQuestion); // We remove the question if it has been already answered with a different answer
          questions.add(event.question);
        }
        yield HumidifierQuestionsLoaded(
            questions: questions,
            patientId: currentState.patientId,
            survey: humidifierSurveyQuestion,
            beginDate: currentState.beginDate);
      }
    }

    if (event is ValidateSurvey) {
      _postSurvey(currentState, true);
    }
    if (event is RefuseSurvey) {
      _postSurvey(currentState, false);
    }
  }

  void _postSurvey(HumidifierQuestionsState currentState, bool hasAccepted) {
    if (currentState is HumidifierQuestionsLoaded) {
      bool hasFinished = false;
      if (currentState.questions.length ==
          currentState.survey.questions.length) {
        hasFinished = true;
      }
      final humidifierSurveyAnswer = new HumidifierSurveyAnswer(
          patient: new Patient(
              renderedTreatmentId: 1, tRCPatient: 231, treatmentId: 1456),
          questionnaire: new Questionnaire(
              hasAccepted: hasAccepted,
              startedAt: currentState.beginDate,
              hasFinished: hasFinished,
              finishedAt: DateTime.now(),
              informationsQuestionnaire:
                  currentState.survey.informationsQuestionnaire),
          questions: currentState.questions,
          technicien: new Technicien(id: 1, name: "John", surname: "Smith"));
      repository.postSurvey(humidifierSurveyAnswer);
    }
  }
}
