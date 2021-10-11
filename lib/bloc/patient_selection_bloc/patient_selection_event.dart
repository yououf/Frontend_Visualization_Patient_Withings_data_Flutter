part of 'patient_selection_bloc.dart';

abstract class PatientSelectionEvent extends Equatable {
  const PatientSelectionEvent();
}

class FetchTechnicianTrip extends PatientSelectionEvent {
  final int technicianId;

  FetchTechnicianTrip({@required this.technicianId});

  @override
  List<Object> get props => [technicianId];
}

class PickPatient extends PatientSelectionEvent {
  final int patientId;

  PickPatient({@required this.patientId});

  @override
  List<Object> get props => [patientId];
}
