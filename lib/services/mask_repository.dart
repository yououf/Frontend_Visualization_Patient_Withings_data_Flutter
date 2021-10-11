import 'package:DIH4CPS_APP/models/mask.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';

class MaskRepository {
  Future<List<Mask>> fetchNasalMask() async {
    final listNasalMask = await HttpRequest.getRequest("masks/nasal");

    return (listNasalMask as List).map((p) => Mask.fromJson(p)).toList();
  }

  Future<List<Mask>> fetchFaceMask() async {
    final listFaceMask = await HttpRequest.getRequest("masks/face");
    return (listFaceMask as List).map((p) => Mask.fromJson(p)).toList();
  }

  Future<List<Mask>> fetchNasalPillowMask() async {
    final listNasalPillowMask =
        await HttpRequest.getRequest("masks/nasal/pillow");
    return (listNasalPillowMask as List).map((p) => Mask.fromJson(p)).toList();
  }

  Future<List<Mask>> fetchAllMask() async {
    final List<Mask> listMask = await fetchFaceMask() +
        await fetchNasalMask() +
        await fetchNasalPillowMask();

    return listMask;
  }

  Future<List<MaskHistoric>> fetchHistoricMask(int idPatient) async {
    final listMask =
        await HttpRequest.getRequest("masks/patient/historic/$idPatient");

    return (listMask as List).map((p) => MaskHistoric.fromJson(p)).toList();
  }

  Future<Mask> fetchSuggestedMask(int idPatient) async {
    final mask =
        await HttpRequest.getRequest("masks/patient/suggested/$idPatient");
    return Mask.fromJson(mask);
  }

  Future<dynamic> postMask(SuggestedMask mask) async {
    final Map<String, dynamic> jsonBody = mask.toJson();

    try {
      await HttpRequest.postRequest(
          "masks/patient/suggested/patient_id/" + mask.patientId.toString(),
          jsonBody);
    } catch (_) {
      throw _;
    }
  }
}
