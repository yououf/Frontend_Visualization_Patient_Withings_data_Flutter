import 'package:DIH4CPS_APP/models/patient.dart';
import 'package:equatable/equatable.dart';

class SensorDetails extends Equatable {
  final List<Experiences> experiences;
  final int idSensorDetail;
  final bool isActive;

  SensorDetails({this.experiences, this.idSensorDetail, this.isActive});

  static SensorDetails fromJson(Map<String, dynamic> json) {
    List<Experiences> experiences;

    if (json['experiences'] != null) {
      experiences = new List<Experiences>();

      json['experiences'].forEach((v) {
        experiences.add(Experiences.fromJson(v));
      });
    }

    return new SensorDetails(
        idSensorDetail: json['id_sensor_detail'],
        experiences: experiences,
        isActive: json['isActive']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.experiences != null) {
      data['experiences'] = this.experiences.map((v) => v.toJson()).toList();
    }
    data['id_sensor_detail'] = this.idSensorDetail;
    data['isActive'] = this.isActive;
    return data;
  }

  @override
  List<Object> get props => [isActive, idSensorDetail, experiences];
}
