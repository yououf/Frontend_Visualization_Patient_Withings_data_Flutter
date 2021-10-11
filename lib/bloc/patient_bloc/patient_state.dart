import 'package:DIH4CPS_APP/models/patient.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class PatientState extends Equatable {
  final int idPatient;

  const PatientState({this.idPatient});

  @override
  List<Object> get props => [idPatient];
}

class PatientEmpty extends PatientState {
  PatientEmpty(int idPatient) : super(idPatient: idPatient);
}

class PatientLoading extends PatientState {
  PatientLoading(int idPatient) : super(idPatient: idPatient);
}

class PatientLoaded extends PatientState {
  final Patient patient;

  PatientLoaded({@required this.patient, @required int patientId})
      : super(idPatient: patientId);

  @override
  List<Object> get props => [patient];
}

class PatientError extends PatientState {
  PatientError(int idPatient) : super(idPatient: idPatient);
}
