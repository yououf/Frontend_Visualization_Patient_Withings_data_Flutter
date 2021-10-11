import 'dart:async';
import 'package:bloc/bloc.dart';
import 'patient_form_event.dart';
import 'patient_form_state.dart';

class PatientFormBloc extends Bloc<PatientFormEvent, PatientFormState> {
  PatientFormBloc()
      : super(
          PatientFormStateLoading(
            endDate: DateTime(2020, 09, 29),
            beginDate: DateTime(2020, 09, 29),
          ),
        );

  @override
  Stream<PatientFormState> mapEventToState(
    PatientFormEvent event,
  ) async* {
    if (event is AddElementPatient) {
      yield PatientFormStateLoading(
          patientId: event.patientId,
          endDate: event.endDate,
          beginDate: event.beginDate);
    }
    if (event is FormValidatedPatient) {
      yield PatientFormStateLoaded(
          patientId: event.patientId,
          endDate: event.endDate,
          beginDate: event.beginDate);
    }
  }
}
