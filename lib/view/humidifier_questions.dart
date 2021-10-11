import 'package:DIH4CPS_APP/components/app_bar.dart';
import 'package:DIH4CPS_APP/components/button_bar.dart';
import 'package:DIH4CPS_APP/models/humidifier_quiz.dart';
import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:DIH4CPS_APP/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DIH4CPS_APP/bloc/bloc.dart';

class MyAppHumidifierQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HumidifierQuestionsBloc, HumidifierQuestionsState>(
            buildWhen: (previous, current) =>
                previous is HumidifierQuestionsLoading,
            builder: (context, state) {
              if (state is HumidifierQuestionsLoaded) {
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, left: 5.0, right: 5.0, top: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Patient: " + state.patientId.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          child: Text(
                            "Dans un but de d'amélioration continue de l'application, pouvez vous répondre à ces questions ?",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            "Questions",
                            style: TextStyle(
                              fontSize: 26.0,
                            ),
                          ),
                        ),
                        Card(
                            child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.survey.questions.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    "Question " + (index + 1).toString() + ":",
                                    style: TextStyle(
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  state.survey.questions[index]
                                      .informationsQuestion.description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                                if (state.survey.questions[index]
                                        .informationsQuestion.answerType ==
                                    "bool")
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MyAppButtonBar(
                                      defaultColor: LindeTheme.backGroundColor,
                                      changeColorWhenClicked: true,
                                      changeColorWhenClickedAgain: true,
                                      heightButtons: 30.0,
                                      takesAllSpaceAvailable: false,
                                      colorOnClicked:LindeTheme.appBarColor,
                                      functionLeftButton: () {
                                        List<Answers> answers =
                                            new List<Answers>();
                                        answers.add(state.survey.questions[index]
                                            .answers[0]); // we save the answers
                                        Questions question = new Questions(
                                            answers: answers,
                                            informationsQuestion: state
                                                .survey
                                                .questions[index]
                                                .informationsQuestion); // we add the answers to the question
                                        context
                                            .read<HumidifierQuestionsBloc>()
                                            .add(AddAnswer(
                                                question: question,
                                                index:
                                                    index)); // we add the question to the other questions
                                      },
                                      functionRightButton: () {
                                        List<Answers> answers =
                                            new List<Answers>();
                                        answers.add(state
                                            .survey.questions[index].answers[1]);
                                        Questions question = new Questions(
                                            answers: answers,
                                            informationsQuestion: state
                                                .survey
                                                .questions[index]
                                                .informationsQuestion);
                                        context
                                            .read<HumidifierQuestionsBloc>()
                                            .add(AddAnswer(
                                                question: question,
                                                index: index));
                                      },
                                      textLeftButton: "Non",
                                      textRightButton: "Oui",
                                    ),
                                  ),
                              ],
                            );
                          },
                        )),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40.0,
                            child: RaisedButton(
                              onPressed: () {
                                context
                                    .read<HumidifierQuestionsBloc>()
                                    .add(ValidateSurvey());
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    "/home_page",
                                    (Route<dynamic> route) => false);
                              },
                              child: Text(
                                "Valider",
                                style: TextStyle(fontSize: 17.0),
                              ),
                              color: Style.validateButtonColor,
                            ),
                          ),
                        ),
                      ]),
                );
              }
              if (state is HumidifierQuestionsLoading)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return Center(
                  child:
                      Text("Erreur lors de la récupération du questionnaire."));
            }),
        appBar: MyAppBar(
          title: Text("Questions"),
          appBar: AppBar(),
        ),
      ),
    );
  }
}
