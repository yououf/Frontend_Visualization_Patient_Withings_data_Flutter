import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PatientEvent extends Equatable {
  const PatientEvent();
}

class FetchPatient extends PatientEvent {
  final int idPatient;

  const FetchPatient({@required this.idPatient});

  @override
  List<Object> get props => [idPatient];
}

class AddIdPatient extends PatientEvent {
  final int idPatient;

  const AddIdPatient({this.idPatient});

  @override
  List<Object> get props => [idPatient];
}
