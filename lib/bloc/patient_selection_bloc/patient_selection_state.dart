part of 'patient_selection_bloc.dart';

abstract class PatientSelectionState extends Equatable {
  const PatientSelectionState();

  @override
  List<Object> get props => [];
}

class PatientSelectionInitial extends PatientSelectionState {}

class PatientSelectionLoading extends PatientSelectionState {}

class PatientSelectionError extends PatientSelectionState {}

class PatientSelectionLoaded extends PatientSelectionState {
  final List<Intervention> listInterventions;
  final int patientId;

  PatientSelectionLoaded(
      {@required this.listInterventions, @required this.patientId});

  @override
  List<Object> get props => [listInterventions, patientId];
}
