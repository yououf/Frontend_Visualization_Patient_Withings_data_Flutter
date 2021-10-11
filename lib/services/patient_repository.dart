import 'dart:async';

import 'package:DIH4CPS_APP/models/measures.dart';
import 'package:DIH4CPS_APP/models/patient.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';

class PatientRepository {
  Future<Patient> fetchPatientById(int id) async {
    final patient = await HttpRequest.getRequest("patients/$id");
    return Patient.fromJson(patient);
  }

  Future<List<Measure>> fetchPatientMeasuresById(
      int id, String beginDate, String endDate, String dataType) async {
    final patientMeasures = await HttpRequest.getRequest(
        "patients/$dataType/date_debut/$beginDate/date_fin/$endDate/id/72425");

    return (patientMeasures as List).map((p) => Measure.fromJson(p)).toList();
  }

  Future<String> fetchRegionPatient(int idPatient) async {
    final json =
        await HttpRequest.getRequest("patients/$idPatient/region/name");
    String regionName = json["region_name"];
    return regionName;
  }
}
