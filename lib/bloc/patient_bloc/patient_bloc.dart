import 'dart:async';

import 'package:DIH4CPS_APP/bloc/patient_bloc/patient_event.dart';
import 'package:DIH4CPS_APP/bloc/patient_bloc/patient_state.dart';
import 'package:DIH4CPS_APP/models/patient.dart';

import 'package:DIH4CPS_APP/services/patient_repository.dart';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final PatientRepository repository;

  PatientBloc({@required this.repository}) : super(PatientEmpty(null));

  @override
  Stream<PatientState> mapEventToState(PatientEvent event) async* {
    if (event is AddIdPatient) {
      final int idPatient = event.idPatient;
      yield PatientEmpty(idPatient);
    }
    if (event is FetchPatient) {
      yield PatientLoading(event.idPatient);
      try {
        final Patient patient =
            await repository.fetchPatientById(event.idPatient);
        yield PatientLoaded(patient: patient, patientId: event.idPatient);
      } catch (_) {
        yield PatientError(event.idPatient);
      }
    }
  }
}
