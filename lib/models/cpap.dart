import 'package:DIH4CPS_APP/utils/date_format.dart';

class Cpap {
  String barCode;
  String deliveryDate;
  String modelName;
  String numeroSerie;
  int provIdInt;
  String provNameStr;
  int treatmentId;
  int renderedTreatmentId;

  Cpap(
      {this.barCode,
      this.deliveryDate,
      this.modelName,
      this.numeroSerie,
      this.provIdInt,
      this.provNameStr,
      this.treatmentId,
      this.renderedTreatmentId});

  Cpap.fromJson(Map<String, dynamic> json) {
    barCode = json['BarCode'];
    deliveryDate = json['DeliveryDate'];
    modelName = json['ModelName'];
    numeroSerie = json['NumeroSerie'];
    provIdInt = json['Prov_Id_int'];
    provNameStr = json['Prov_Name_str'];
    treatmentId = json['TreatmentId'];
    renderedTreatmentId = json['LastRenderedTreatmentID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BarCode'] = this.barCode;
    data['DeliveryDate'] = this.deliveryDate;
    data['ModelName'] = this.modelName;
    data['NumeroSerie'] = this.numeroSerie;
    data['Prov_Id_int'] = this.provIdInt;
    data['Prov_Name_str'] = this.provNameStr;
    data['TreatmentId'] = this.treatmentId;
    data['LastRenderedTreatmentID'] = this.renderedTreatmentId;
    return data;
  }
}

class SuggestedHumidifier {
  DateTime date;
  int id;
  bool isAccepted;
  int tubeTemperature;
  int humidifier;
  int patientId;
  int techId;
  bool isHumidifierSuggested;
  int treatmentId;
  int renderedTreatmentId;

  SuggestedHumidifier(
      {this.date,
      this.isAccepted,
      this.tubeTemperature,
      this.humidifier,
      this.patientId,
      this.techId,
      this.isHumidifierSuggested,
      this.treatmentId,
      this.renderedTreatmentId});

  SuggestedHumidifier.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    id = json['Id'];
    isAccepted = json['IsAccepted'];
    tubeTemperature = json['Param_TubeTemperature'];
    humidifier = json['Param_Humidifier'];
    techId = json['TechId'];
    isHumidifierSuggested = json['IsHumidifierSuggested'];
    treatmentId = json['TreatmentId'];
    renderedTreatmentId = json['LastRenderedTreatmentID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = FormatDate.formatter3.format(this.date);
    data['IsAccepted'] = this.isAccepted;
    data['Param_TubeTemperature'] = this.tubeTemperature;
    data['Param_Humidifier'] = this.humidifier;
    data['TechId'] = this.techId;
    data['IsHumidifierSuggested'] = this.isHumidifierSuggested;
    data['TreatmentId'] = this.treatmentId;
    data['LastRenderedTreatmentID'] = this.renderedTreatmentId;
    return data;
  }
}
