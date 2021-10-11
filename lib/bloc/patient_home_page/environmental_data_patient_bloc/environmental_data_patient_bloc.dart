import 'dart:async';

import 'package:DIH4CPS_APP/models/dih_data_patient.dart';
import 'package:DIH4CPS_APP/services/data_patient_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

part 'environmental_data_patient_event.dart';

part 'environmental_data_patient_state.dart';

class EnvironmentalDataPatientBloc
    extends Bloc<EnvironmentalDataPatientEvent, EnvironmentalDataPatientState> {
  final DataPatientRepository repository;

  EnvironmentalDataPatientBloc({this.repository})
      : super(EnvironmentalDataPatientInitial());

  @override
  Stream<EnvironmentalDataPatientState> mapEventToState(
    EnvironmentalDataPatientEvent event,
  ) async* {
    final currentState = state;

    final String endDate =
        DateFormat('yyyy-MM-dd hh:mm').format(DateTime(2020, 12, 08));

    yield EnvironmentalDataPatientLoading();

    if (currentState is EnvironmentalDataPatientLoaded) {
      String beginDate = _getBeginDate(currentState.range);

      if (event is GetInDoorEnvironmentalDataPatient) {
        yield* _fetchInDoorEnvironmentalDataPatient(endDate, beginDate,
            event.idPatient, currentState.range, event.dataType);
      }

      if (event is GetOutDoorEnvironmentalDataPatient) {
        yield* _fetchOutDoorEnvironmentalDataPatient(endDate, beginDate,
            event.idPatient, currentState.range, event.dataType);
      }
    } else {
      if (event is GetInDoorEnvironmentalDataPatient) {
        String beginDate = _getBeginDate("30");

        yield* _fetchInDoorEnvironmentalDataPatient(
            endDate, beginDate, event.idPatient, "30", event.dataType);
      }
    }
    if (event is GetEnvironmentalDataPatient30Days) {
      String beginDate = _getBeginDate("30");
      if (currentState is EnvironmentalDataPatientLoadedInDoor) {
        yield* _fetchInDoorEnvironmentalDataPatient(
            endDate, beginDate, event.idPatient, "30", event.dataType);
      }
      if (currentState is EnvironmentalDataPatientLoadedOutDoor) {
        yield* _fetchOutDoorEnvironmentalDataPatient(
            endDate, beginDate, event.idPatient, "30", event.dataType);
      }
    }
    if (event is GetEnvironmentalDataPatient90Days) {
      String beginDate = _getBeginDate("90");
      if (currentState is EnvironmentalDataPatientLoadedInDoor) {
        yield* _fetchInDoorEnvironmentalDataPatient(
            endDate, beginDate, event.idPatient, "90", event.dataType);
      }
      if (currentState is EnvironmentalDataPatientLoadedOutDoor) {
        yield* _fetchOutDoorEnvironmentalDataPatient(
            endDate, beginDate, event.idPatient, "90", event.dataType);
      }
    }

    if (event is GetEnvironmentalDataPatient180Days) {
      String beginDate = _getBeginDate("180");
      if (currentState is EnvironmentalDataPatientLoadedInDoor) {
        yield* _fetchInDoorEnvironmentalDataPatient(
            endDate, beginDate, event.idPatient, "180", event.dataType);
      }
      if (currentState is EnvironmentalDataPatientLoadedOutDoor) {
        yield* _fetchOutDoorEnvironmentalDataPatient(
            endDate, beginDate, event.idPatient, "180", event.dataType);
      }
    }
  }

  String _getBeginDate(String range) {
    DateTime dateEnd = DateTime(2020, 12, 08);

    switch (range) {
      case "30":
        return DateFormat('yyyy-MM-dd hh:mm')
            .format(DateTime(dateEnd.year, dateEnd.month, dateEnd.day - 30));
        break;
      case "90":
        return DateFormat('yyyy-MM-dd hh:mm')
            .format(DateTime(dateEnd.year, dateEnd.month - 3, dateEnd.day));
        break;
      case "180":
        return DateFormat('yyyy-MM-dd hh:mm')
            .format(DateTime(dateEnd.year, dateEnd.month - 6, dateEnd.day));
        break;
      default:
        return null;
    }
  }

  Stream<EnvironmentalDataPatientState> _fetchOutDoorEnvironmentalDataPatient(
      String endDate,
      String beginDate,
      int patientId,
      String range,
      String dataType) async* {
    try {
      List<DataPatient> listEnvironmentalDataPatient =
          await repository.fetchOutdoorEnvironmentalDataPatientPatient(
              patientId, beginDate, endDate, dataType);

      yield EnvironmentalDataPatientLoadedOutDoor(
          listData: listEnvironmentalDataPatient, range: range);
    } on Exception catch (_) {
      yield EnvironmentalDataPatientError();
    }
  }

  Stream<EnvironmentalDataPatientState> _fetchInDoorEnvironmentalDataPatient(
      String endDate,
      String beginDate,
      int patientId,
      String range,
      String dataType) async* {
    try {
      List<DataPatient> listEnvironmentalDataPatient =
          await repository.fetchIndoorEnvironmentalDataPatientPatient(
              patientId, beginDate, endDate, dataType);

      yield EnvironmentalDataPatientLoadedInDoor(
          listData: listEnvironmentalDataPatient, range: range);
    } on Exception catch (_) {
      yield EnvironmentalDataPatientError();
    }
  }
}
