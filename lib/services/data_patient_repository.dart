import 'package:DIH4CPS_APP/models/dih_data_patient.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';

class DataPatientRepository {
  final String patientDataUri = "environmental_data";

  Future<List<DataPatient>> fetchIndoorEnvironmentalDataPatientPatient(
      int idPatient, String beginDate, String endDate, String dataType) async {
    final listDataPatient = await HttpRequest.getRequest(
        "$patientDataUri/indoor_$dataType/$beginDate/$endDate/patient/$idPatient");

    return (listDataPatient as List)
        .map((p) => DataPatient.fromJson(p, "Humidité intérieur"))
        .toList();
  }

  Future<List<DataPatient>> fetchOutdoorEnvironmentalDataPatientPatient(
      int idPatient, String beginDate, String endDate, String dataType) async {
    final listDataPatient = await HttpRequest.getRequest(
        "$patientDataUri/outdoor_$dataType/$beginDate/$endDate/patient/$idPatient");

    return (listDataPatient as List)
        .map((p) => DataPatient.fromJson(p, "Humidité intérieur"))
        .toList();
  }

  Future<DataPatient> fetchLastOutdoorHumidity(int patientId) async {
    return _getPatientLastData(
        patientId, "last_outdoor_humidity", "Humidité extérieur");
  }

  Future<DataPatient> fetchLastIndoorHumidity(int patientId) async {
    return _getPatientLastData(
        patientId, "last_indoor_humidity", "Humidité intérieur");
  }

  Future<DataPatient> fetchLastCo2Level(int patientId) async {
    return _getPatientLastData(
        patientId, "last_co2_level", "Niveau de CO2");
  }

  Future<DataPatient> fetchLastNoise(int patientId) async {
    return _getPatientLastData(
        patientId, "last_noise", "Bruit intérieur");
  }

  Future<DataPatient> fetchLastPressure(int patientId) async {
    return _getPatientLastData(
        patientId, "last_absolute_pressure", "Pression intérieur");
  }

  Future<DataPatient> fetchLastOutdoorTemperature(int patientId) async {
    return _getPatientLastData(
        patientId, "last_outdoor_temperature", "Température extérieur");
  }

  Future<DataPatient> fetchLastIndoorTemperature(int patientId) async {
    return _getPatientLastData(
        patientId, "last_indoor_temperature", "Température intérieur");
  }

  Future<DataPatient> _getPatientLastData(
      int patientId, String dataType, String description) async {
    final dataPatient = await HttpRequest.getRequest(
        "$patientDataUri/$dataType/patient/$patientId");
    return DataPatient.fromJson(dataPatient, description);
  }
}
