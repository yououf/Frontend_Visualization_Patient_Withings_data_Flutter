import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PatientFormState extends Equatable {
  const PatientFormState();

  @override
  List<Object> get props => [];
}

class PatientFormStateEmpty extends PatientFormState {}

class PatientFormStateLoading extends PatientFormState {
  final int patientId;
  final DateTime beginDate;
  final DateTime endDate;

  const PatientFormStateLoading({this.patientId, this.endDate, this.beginDate});

  @override
  List<Object> get props => [patientId, beginDate, endDate];
}

class PatientFormStateLoaded extends PatientFormState {
  final int patientId;
  final DateTime beginDate;
  final DateTime endDate;

  const PatientFormStateLoaded(
      {@required this.patientId,
      @required this.endDate,
      @required this.beginDate});

  @override
  List<Object> get props => [patientId, beginDate, endDate];
}
