import 'dart:async';

import 'package:DIH4CPS_APP/models/measures.dart';
import 'package:DIH4CPS_APP/models/region.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';
import '../utils/date_format.dart';

class RegionRepository {
  Future<List<RegionZipCodesIdName>> fetchRegionsZipCodesIdName() async {
    final regions = await HttpRequest.getRequest("regions/types");

    return (regions as List)
        .map((p) => RegionZipCodesIdName.fromJson(p))
        .toList();
  }

  Future<List<Region>> fetchRegionsByTypeNameRegion(
      String typeNameRegion) async {
    String endpoint = "regions/type/name/" + typeNameRegion;
    final regions = await HttpRequest.getRequest(endpoint);
    return (regions as List).map((p) => Region.fromJson(p)).toList();
  }

  Future<List<Measure>> fetchRegionMeasuresById(
      String regionName, DateTime beginDate, DateTime endDate) async {
    String dateDebutString = FormatDate.formatter2.format(beginDate);
    String dateFinString = FormatDate.formatter2.format(endDate);

    final regionMeasures = await HttpRequest.getRequest(
        "regions/score/date_debut/$dateDebutString/date_fin/$dateFinString/name/$regionName");

    return (regionMeasures as List).map((p) => Measure.fromJson(p)).toList();
  }

  Future<List<Measure>> fetchRegionComplianceById(
      String regionName, DateTime beginDate, DateTime endDate) async {
    String dateDebutString = FormatDate.formatter2.format(beginDate);
    String dateFinString = FormatDate.formatter2.format(endDate);

    final regionMeasures = await HttpRequest.getRequest(
        "regions/compliance/date_debut/$dateDebutString/date_fin/$dateFinString/name/$regionName");

    return (regionMeasures as List).map((p) => Measure.fromJson(p)).toList();
  }

  Future<List<Measure>> fetchRegionLeakageById(
      String regionName, DateTime beginDate, DateTime endDate) async {
    String dateDebutString = FormatDate.formatter2.format(beginDate);
    String dateFinString = FormatDate.formatter2.format(endDate);

    final regionMeasures = await HttpRequest.getRequest(
        "regions/leakage/date_debut/$dateDebutString/date_fin/$dateFinString/name/$regionName");

    return (regionMeasures as List).map((p) => Measure.fromJson(p)).toList();
  }

  Future<List<Measure>> fetchRegionAhiById(
      String regionName, DateTime beginDate, DateTime endDate) async {
    String dateDebutString = FormatDate.formatter2.format(beginDate);
    String dateFinString = FormatDate.formatter2.format(endDate);

    final regionMeasures = await HttpRequest.getRequest(
        "regions/ahi/date_debut/$dateDebutString/date_fin/$dateFinString/name/$regionName");

    return (regionMeasures as List).map((p) => Measure.fromJson(p)).toList();
  }
}
