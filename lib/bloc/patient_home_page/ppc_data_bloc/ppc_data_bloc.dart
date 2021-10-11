import 'dart:async';

import 'package:DIH4CPS_APP/models/measures.dart';
import 'package:DIH4CPS_APP/services/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

part 'ppc_data_event.dart';

part 'ppc_data_state.dart';

class PpcDataBloc extends Bloc<PpcDataEvent, PpcDataState> {
  final PatientRepository repository;

  PpcDataBloc({@required this.repository}) : super(PpcDataInitial());

  @override
  Stream<PpcDataState> mapEventToState(PpcDataEvent event,) async* {
    final currentState = state;

    final String endDate = DateFormat('yyyyMMdd').format(DateTime(2020,10,01));

    yield PpcDataLoading();

    if (currentState is PpcDataLoaded) {
      String beginDate = _getBeginDate(currentState.range);

      if (event is GetLeakage) {
        try {
          List<Measure> listMeasure = await repository.fetchPatientMeasuresById(
              event.patientId, beginDate, endDate, event.dataType);

          yield PpcDataLoaded(
              listMeasure: listMeasure,
              range: currentState.range,
              dataType: "leakage");
        } catch (_) {
          yield PpcDataError();
        }
      }

      if (event is GetCompliance) {
        try {
          List<Measure> listMeasure = await repository.fetchPatientMeasuresById(
              event.patientId, beginDate, endDate, event.dataType);


          yield PpcDataLoaded(
              listMeasure: listMeasure,
              range: currentState.range,
              dataType: "compliance");
        } catch (_) {
          yield PpcDataError();
        }
      }

      if (event is GetIAH) {
        try {
          List<Measure> listMeasure = await repository.fetchPatientMeasuresById(
              event.patientId, beginDate, endDate, event.dataType);

          yield PpcDataLoaded(
              listMeasure: listMeasure,
              range: currentState.range,
              dataType: "ahi");
        } catch (_) {
          yield PpcDataError();
        }
      }

      if (event is GetPPCDataPatient7Days) {
        beginDate = _getBeginDate("7");

        try {
          List<Measure> listMeasure = await repository.fetchPatientMeasuresById(
              event.patientId, beginDate, endDate, currentState.dataType);

          yield PpcDataLoaded(
              listMeasure: listMeasure,
              range: "7",
              dataType: currentState.dataType);
        } catch (_) {
          yield PpcDataError();
        }
      }
      if (event is GetPPCDataPatient30Days) {
        beginDate = _getBeginDate("30");

        try {
          List<Measure> listMeasure = await repository.fetchPatientMeasuresById(
              event.patientId, beginDate, endDate, currentState.dataType);

          yield PpcDataLoaded(
              listMeasure: listMeasure,
              range: "30",
              dataType: currentState.dataType);
        } catch (_) {
          yield PpcDataError();
        }
      }

      if (event is GetPPCDataPatient90Days) {
        beginDate = _getBeginDate("90");

        try {
          List<Measure> listMeasure = await repository.fetchPatientMeasuresById(
              event.patientId, beginDate, endDate, currentState.dataType);

          yield PpcDataLoaded(
              listMeasure: listMeasure,
              range: "90",
              dataType: currentState.dataType);
        } catch (_) {
          yield PpcDataError();
        }
      }
    } else if (event is GetCompliance) {
      String beginDate = _getBeginDate("7");
      try {
        List<Measure> listMeasure = await repository.fetchPatientMeasuresById(
            event.patientId, beginDate, endDate, event.dataType);

        yield PpcDataLoaded(
            listMeasure: listMeasure, range: "7", dataType: "compliance");
      } catch (_) {
        print(_.toString());
        yield PpcDataError();
      }
    }
  }

  String _getBeginDate(String range) {
    DateTime beginDateTime = DateTime(2020,10,01);

    switch (range) {
      case "7":
        return DateFormat('yyyyMMdd').format(DateTime(
            beginDateTime.year, beginDateTime.month, beginDateTime.day - 7));
        break;
      case "30":
        return DateFormat('yyyyMMdd').format(DateTime(
            beginDateTime.year,
            beginDateTime.month,
            beginDateTime.day - 30));
        break;
      case "90":
        return DateFormat('yyyyMMdd').format(DateTime(
            beginDateTime.year, beginDateTime.month - 3, beginDateTime.day));
        break;
      case "180":
        return DateFormat('yyyyMMdd').format(DateTime(
            beginDateTime
                .year,
            beginDateTime
                .month - 6, beginDateTime
            .day));
        break;
      default:
        return null;
    }
  }
}
