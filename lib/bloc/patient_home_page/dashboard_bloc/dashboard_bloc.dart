import 'dart:async';

import 'package:DIH4CPS_APP/models/dih_data_patient.dart';
import 'package:DIH4CPS_APP/services/data_patient_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({@required this.repository}) : super(DashboardEmpty());

  final DataPatientRepository repository;

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    yield DashboardLoading();
    if (event is GetDashboard) {
      List<DataPatient> patientData = new List<DataPatient>();

      try {
        patientData
            .add(await repository.fetchLastIndoorTemperature(event.patientId));
        patientData
            .add(await repository.fetchLastOutdoorTemperature(event.patientId));
        patientData.add(await repository.fetchLastCo2Level(event.patientId));
        patientData
            .add(await repository.fetchLastOutdoorHumidity(event.patientId));
        patientData
            .add(await repository.fetchLastIndoorHumidity(event.patientId));
        patientData.add(await repository.fetchLastNoise(event.patientId));
        patientData.add(await repository.fetchLastPressure(event.patientId));

        yield DashboardLoaded(patientData: patientData);
      } catch (_) {
        yield DashboardError();
      }
    }
  }
}
