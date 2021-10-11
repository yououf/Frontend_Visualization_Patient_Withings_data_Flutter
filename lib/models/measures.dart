import 'package:equatable/equatable.dart';

class Measure extends Equatable {
  final DateTime measRecordDt;
  final double value;
  final int id;

  Measure({this.id, this.measRecordDt, this.value}) : super();

  static Measure fromJson(Map<String, dynamic> json) {
    return Measure(
        measRecordDt: DateTime.parse(json['Meas_Record_dt'].toString()),
        id: json['Pat_Id_int'],
        value: json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Meas_Record_dt'] = this.measRecordDt;
    data['Pat_Id_int'] = this.id;
    data['value'] = this.value;
    return data;
  }

  @override
  List<Object> get props => [measRecordDt, value, id];
}
