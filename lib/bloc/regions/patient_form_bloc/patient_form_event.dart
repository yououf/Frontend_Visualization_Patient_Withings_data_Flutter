import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PatientFormEvent extends Equatable {
  const PatientFormEvent();
}

class AddElementPatient extends PatientFormEvent {
  final int patientId;
  final DateTime beginDate;
  final DateTime endDate;

  const AddElementPatient({this.patientId, this.beginDate, this.endDate});

  @override
  List<Object> get props => [];
}

class FormValidatedPatient extends PatientFormEvent {
  final int patientId;
  final DateTime beginDate;
  final DateTime endDate;

  const FormValidatedPatient(
      {@required this.patientId,
      @required this.beginDate,
      @required this.endDate});

  @override
  List<Object> get props => [patientId, beginDate, endDate];
}
