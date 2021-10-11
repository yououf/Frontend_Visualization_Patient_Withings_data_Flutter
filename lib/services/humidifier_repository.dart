import 'package:DIH4CPS_APP/models/cpap.dart';
import 'package:DIH4CPS_APP/models/humidifier_quiz.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';

class HumidifierRepository {
  final String humidifierUri = "humidifiers";

  Future<bool> fecthHumidifierNeeded(int idPatient) async {
    final json = await HttpRequest.getRequest(
        "$humidifierUri/needs_humidifier/$idPatient");

    return (json["needs_humidifier"]);
  }

  Future<Cpap> fecthLastCpap(int idPatient) async {
    final lastCpap =
        await HttpRequest.getRequest("$humidifierUri/last_CPAP/$idPatient");

    return Cpap.fromJson(lastCpap);
  }

  Future<List<HumidifierSurveyQuestion>> fetchAllQuestions() async {
    final humidifierSurvey = await HttpRequest.getRequest(
        "$humidifierUri/quiz_humidifier/questions/");

    return (humidifierSurvey as List)
        .map((p) => HumidifierSurveyQuestion.fromJson(p))
        .toList();
  }

  Future<dynamic> postHumidifier(SuggestedHumidifier humidifier) async {
    final Map<String, dynamic> jsonBody = humidifier.toJson();

    try {
      await HttpRequest.postRequest(
          "$humidifierUri/patient/suggested/patient_id/" +
              humidifier.patientId.toString(),
          jsonBody);
    } catch (_) {
      throw _;
    }
  }

  Future<dynamic> postSurvey(HumidifierSurveyAnswer survey) async {
    final Map<String, dynamic> jsonBody = survey.toJson();

    try {
      await HttpRequest.postRequest(
          "$humidifierUri/quiz_humidifier/questions/result", jsonBody);
    } catch (_) {
      throw _;
    }
  }
}
