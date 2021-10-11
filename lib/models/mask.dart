import 'package:DIH4CPS_APP/utils/date_format.dart';

class Mask {
  String description;
  String id;
  double price;
  String provider;

  Mask({this.description, this.id, this.price, this.provider});

  Mask.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    price = json['price'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['price'] = this.price;
    data['provider'] = this.provider;
    return data;
  }
}

class MaskHistoric {
  DateTime date;
  String description;
  String id;
  int patientId;
  String provider;

  MaskHistoric(
      {this.date, this.description, this.id, this.patientId, this.provider});

  MaskHistoric.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    description = json['description'];
    id = json['id'];
    patientId = json['patient_id'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date.toString();
    data['description'] = this.description;
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['provider'] = this.provider;
    return data;
  }
}

class SuggestedMask {
  DateTime date;
  int id;
  bool isAccepted;
  String maskSelectedId;
  String maskSuggestedId;
  int patientId;
  int techId;

  SuggestedMask(
      {this.date,
      this.isAccepted,
      this.maskSelectedId,
      this.maskSuggestedId,
      this.patientId,
      this.techId});

  SuggestedMask.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    id = json['Id'];
    isAccepted = json['IsAccepted'];
    maskSelectedId = json['MaskSelectedId'];
    maskSuggestedId = json['MaskSuggestedId'];
    techId = json['TechId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = FormatDate.formatter3.format(this.date);
    data['IsAccepted'] = this.isAccepted;
    data['MaskSelectedId'] = this.maskSelectedId;
    data['MaskSuggestedId'] = this.maskSuggestedId;
    data['TechId'] = this.techId;
    return data;
  }
}
