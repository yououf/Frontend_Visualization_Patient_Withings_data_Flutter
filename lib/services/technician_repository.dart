import 'dart:async';

import 'package:DIH4CPS_APP/models/technician.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';

class TechnicianRepository {
  final String endpoint = "technicians";

  Future<List<Intervention>> fetchTripTechnician(
      int idTech, String date) async {
    final json = await HttpRequest.getRequest(
        "$endpoint/trips/date/$date/technician/" + idTech.toString());

    return (json as List).map((p) => Intervention.fromJson(p)).toList();
  }
}
