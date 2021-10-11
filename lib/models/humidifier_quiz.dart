import 'package:DIH4CPS_APP/utils/date_format.dart';
import 'package:equatable/equatable.dart';

class HumidifierSurveyQuestion extends Equatable {
  final InformationsQuestionnaire informationsQuestionnaire;
  final List<Questions> questions;

  HumidifierSurveyQuestion({this.informationsQuestionnaire, this.questions});

  static HumidifierSurveyQuestion fromJson(Map<String, dynamic> json) {
    final InformationsQuestionnaire informationsQuestionnaire =
        json['informations_questionnaire'] != null
            ? InformationsQuestionnaire.fromJson(
                json['informations_questionnaire'])
            : null;
    List<Questions> questions;
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(Questions.fromJson(v));
      });
    }

    return HumidifierSurveyQuestion(
      informationsQuestionnaire: informationsQuestionnaire,
      questions: questions,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.informationsQuestionnaire != null) {
      data['informations_questionnaire'] =
          this.informationsQuestionnaire.toJson();
    }
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object> get props => [informationsQuestionnaire, questions];
}

class HumidifierSurveyAnswer extends Equatable {
  final List<Questions> questions;
  final Technicien technicien;
  final Patient patient;
  final Questionnaire questionnaire;

  HumidifierSurveyAnswer(
      {this.questions, this.technicien, this.patient, this.questionnaire});

  static HumidifierSurveyAnswer fromJson(Map<String, dynamic> json) {
    List<Questions> questions;

    if (json['questions'] != null) {
      questions = List<Questions>();
      json['questions'].forEach((v) {
        questions.add(Questions.fromJson(v));
      });
    }
    final Technicien technicien = json['technicien'] != null
        ? Technicien.fromJson(json['technicien'])
        : null;
    final Patient patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    final Questionnaire questionnaire = json['questionnaire'] != null
        ? Questionnaire.fromJson(json['questionnaire'])
        : null;

    return new HumidifierSurveyAnswer(
        patient: patient,
        questionnaire: questionnaire,
        questions: questions,
        technicien: technicien);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    if (this.technicien != null) {
      data['technicien'] = this.technicien.toJson();
    }
    if (this.patient != null) {
      data['patient'] = this.patient.toJson();
    }
    if (this.questionnaire != null) {
      data['questionnaire'] = this.questionnaire.toJson();
    }
    return data;
  }

  @override
  List<Object> get props => [questions, technicien, patient, questionnaire];
}

class InformationsQuestionnaire extends Equatable {
  final String name;
  final String descriptionFr;
  final String description;

  InformationsQuestionnaire({this.name, this.descriptionFr, this.description});

  static InformationsQuestionnaire fromJson(Map<String, dynamic> json) {
    return new InformationsQuestionnaire(
        name: json['name'],
        description: json['description'],
        descriptionFr: json['description_fr']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description_fr'] = this.descriptionFr;
    data['description'] = this.description;
    return data;
  }

  @override
  List<Object> get props => [name, descriptionFr, description];
}

class Answers extends Equatable {
  final int ordre;
  final bool value;

  Answers({this.ordre, this.value});

  static Answers fromJson(Map<String, dynamic> json) {
    return new Answers(ordre: json['ordre'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ordre'] = this.ordre;
    data['value'] = this.value;
    return data;
  }

  @override
  List<Object> get props => [ordre, value];
}

class Questions extends Equatable {
  final InformationsQuestion informationsQuestion;
  final List<Answers> answers;

  Questions({this.informationsQuestion, this.answers});

  static Questions fromJson(Map<String, dynamic> json) {
    final InformationsQuestion informationsQuestion =
        json['informations_question'] != null
            ? InformationsQuestion.fromJson(json['informations_question'])
            : null;

    List<Answers> answers;
    if (json['answers'] != null) {
      answers = new List<Answers>();
      json['answers'].forEach((v) {
        answers.add(Answers.fromJson(v));
      });
    }

    return new Questions(
        answers: answers, informationsQuestion: informationsQuestion);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.informationsQuestion != null) {
      data['informations_question'] = this.informationsQuestion.toJson();
    }
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object> get props => [informationsQuestion, answers];
}

class InformationsQuestion extends Equatable {
  final int ordre;
  final String title;
  final String description;
  final String answerType;

  InformationsQuestion(
      {this.ordre, this.title, this.description, this.answerType});

  static InformationsQuestion fromJson(Map<String, dynamic> json) {
    return new InformationsQuestion(
        answerType: json['answer_type'],
        description: json['description'],
        ordre: json['ordre'],
        title: json['title']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ordre'] = this.ordre;
    data['title'] = this.title;
    data['description'] = this.description;
    data['answer_type'] = this.answerType;
    return data;
  }

  @override
  List<Object> get props => [ordre, title, description, answerType];
}

class Technicien extends Equatable {
  final int id;
  final String surname;
  final String name;

  Technicien({this.id, this.surname, this.name});

  static Technicien fromJson(Map<String, dynamic> json) {
    return new Technicien(
        id: json['id'], name: json['name'], surname: json['surname']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['surname'] = this.surname;
    data['name'] = this.name;
    return data;
  }

  @override
  List<Object> get props => [name, id, surname];
}

class Patient extends Equatable {
  final int tRCPatient;
  final int treatmentId;
  final int renderedTreatmentId;

  Patient({this.tRCPatient, this.treatmentId, this.renderedTreatmentId});

  static Patient fromJson(Map<String, dynamic> json) {
    return new Patient(
        renderedTreatmentId: json['RenderedTreatmentId'],
        tRCPatient: json['TRC_patient'],
        treatmentId: json['TreatmentId']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TRC_patient'] = this.tRCPatient;
    data['TreatmentId'] = this.treatmentId;
    data['RenderedTreatmentId'] = this.renderedTreatmentId;
    return data;
  }

  @override
  List<Object> get props => [tRCPatient, treatmentId, renderedTreatmentId];
}

class Questionnaire extends Equatable {
  final InformationsQuestionnaire informationsQuestionnaire;
  final DateTime startedAt;
  final DateTime finishedAt;
  final bool hasFinished;
  final bool hasAccepted;

  Questionnaire(
      {this.informationsQuestionnaire,
      this.startedAt,
      this.finishedAt,
      this.hasFinished,
      this.hasAccepted});

  static Questionnaire fromJson(Map<String, dynamic> json) {
    final InformationsQuestionnaire informationsQuestionnaire =
        json['informations_questionnaire'] != null
            ? InformationsQuestionnaire.fromJson(
                json['informations_questionnaire'])
            : null;

    return new Questionnaire(
        hasFinished: json['hasFinished'],
        finishedAt: json['finished_at'],
        informationsQuestionnaire: informationsQuestionnaire,
        startedAt: json['started_at'],
        hasAccepted: json['hasAccepted']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.informationsQuestionnaire != null) {
      data['informations_questionnaire'] =
          this.informationsQuestionnaire.toJson();
    }
    data['started_at'] = FormatDate.formatter3.format(this.startedAt);
    data['finished_at'] = FormatDate.formatter3.format(this.finishedAt);
    data['hasFinished'] = this.hasFinished;
    data['hasAccepted'] = this.hasAccepted;
    return data;
  }

  @override
  List<Object> get props => [
        informationsQuestionnaire,
        startedAt,
        finishedAt,
        hasFinished,
        hasAccepted
      ];
}
