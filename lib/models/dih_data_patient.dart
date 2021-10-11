import 'package:DIH4CPS_APP/models/sensor.dart';
import 'package:equatable/equatable.dart';

class DataPatient extends Equatable {
  final String databaseDate;
  final int id;
  final int idSensorDetail;
  final DateTime measureDate;
  final SensorDetails sensorDetails;
  final String unity;
  final double valueData;
  final String description;

  DataPatient(
      {this.databaseDate,
      this.id,
      this.idSensorDetail,
      this.measureDate,
      this.sensorDetails,
      this.unity,
      this.valueData,
      this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['database_date'] = this.databaseDate;
    data['id'] = this.id;
    data['id_sensor_detail'] = this.idSensorDetail;
    data['measure_date'] = this.measureDate.toString();
    if (this.sensorDetails != null) {
      data['sensor_details'] = this.sensorDetails.toJson();
    }
    data['unity'] = this.unity;
    data['value_data'] = this.valueData;
    return data;
  }

  static DataPatient fromJson(Map<String, dynamic> json, String description) {
    SensorDetails sensorDetails = json['sensor_details'] != null
        ? SensorDetails.fromJson(json['sensor_details'])
        : null;

    return new DataPatient(
        unity: json["unity"],
        valueData: json["value_data"],
        sensorDetails: sensorDetails,
        measureDate: DateTime.parse(json["measure_date"]),
        idSensorDetail: json["id_sensor_detail"],
        databaseDate: json["database_date"],
        description: description,
        id: json["id"]);
  }

  @override
  List<Object> get props => [
        description,
        valueData,
        unity,
        sensorDetails,
        measureDate,
        idSensorDetail,
        id,
        databaseDate
      ];
}

class Humidity extends DataPatient {
  Humidity(
      {String databaseDate,
      int id,
      int idSensorDetail,
      DateTime measureDate,
      SensorDetails sensorDetails,
      String unity,
      double valueData,
      String description})
      : super(
            id: id,
            description: description,
            databaseDate: databaseDate,
            idSensorDetail: idSensorDetail,
            measureDate: measureDate,
            sensorDetails: sensorDetails,
            unity: unity,
            valueData: valueData);

  static Humidity fromJson(Map<String, dynamic> json, String description) {
    SensorDetails sensorDetails = json['sensor_details'] != null
        ? SensorDetails.fromJson(json['sensor_details'])
        : null;

    return new Humidity(
        unity: json["unity"],
        valueData: json["value_data"],
        sensorDetails: sensorDetails,
        measureDate: json["measure_date"],
        idSensorDetail: json["id_sensor_detail"],
        databaseDate: json["database_date"],
        description: description,
        id: json["id"]);
  }
}

class Temperature extends DataPatient {
  Temperature(
      {String databaseDate,
      int id,
      int idSensorDetail,
      DateTime measureDate,
      SensorDetails sensorDetails,
      String unity,
      double valueData,
      String description})
      : super(
            id: id,
            description: description,
            databaseDate: databaseDate,
            idSensorDetail: idSensorDetail,
            measureDate: measureDate,
            sensorDetails: sensorDetails,
            unity: unity,
            valueData: valueData);

  static Temperature fromJson(Map<String, dynamic> json, String description) {
    SensorDetails sensorDetails = json['sensor_details'] != null
        ? SensorDetails.fromJson(json['sensor_details'])
        : null;

    return new Temperature(
        unity: json["unity"],
        valueData: json["value_data"],
        sensorDetails: sensorDetails,
        measureDate: json["measure_date"],
        idSensorDetail: json["id_sensor_detail"],
        databaseDate: json["database_date"],
        description: description,
        id: json["id"]);
  }
}
