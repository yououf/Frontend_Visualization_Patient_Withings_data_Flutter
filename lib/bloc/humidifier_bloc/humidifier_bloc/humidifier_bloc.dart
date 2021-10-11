import 'dart:async';

import 'package:DIH4CPS_APP/models/cpap.dart';
import 'package:DIH4CPS_APP/models/dih_data_patient.dart';
import 'package:DIH4CPS_APP/services/humidifier_repository.dart';
import 'package:DIH4CPS_APP/services/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'humidifier_event.dart';

part 'humidifier_state.dart';

class HumidifierBloc extends Bloc<HumidifierEvent, HumidifierState> {
  final HumidifierRepository repository;
  final DataPatientRepository repositoryDataPatient;

  HumidifierBloc(
      {@required this.repository, @required this.repositoryDataPatient})
      : super(HumidifierEmpty());

  @override
  Stream<HumidifierState> mapEventToState(
    HumidifierEvent event,
  ) async* {
    if (event is FetchPatientData) {
      yield HumidifierLoading();

      int patientId = 1; //To change when the base will be fulfilled

      try {
        bool humidifierNeeded =
            await repository.fecthHumidifierNeeded(event.patientId);

        try {
          List<DataPatient> patientData = new List<DataPatient>();
          patientData.add(await repositoryDataPatient
              .fetchLastIndoorTemperature(patientId));
          patientData.add(await repositoryDataPatient
              .fetchLastOutdoorTemperature(patientId));
          patientData.add(await repositoryDataPatient
              .fetchLastOutdoorHumidity(patientId));
          patientData.add(await repositoryDataPatient
              .fetchLastIndoorHumidity(patientId));
          Cpap lastCpap = await repository.fecthLastCpap(event.patientId);
          print("la");
          if (humidifierNeeded) {
            yield HumidifierSuggested(
                environmentalData: patientData,
                lastCpap: lastCpap,
                patientId: event.patientId,
                settingHumidifier: 3,
                settingTemp: 3,
                textDescription:
                    "D'après l'analyse des données, l'installation d'un humidificateur est conseillé.");
          } else {
            yield HumidifierNotSuggested(
                descriptionText:
                    "D'après l'analyse des données, l'installation d'un humidificateur est déconseillé.",
                environmentalData: patientData,
                patientId: event.patientId,
                lastCpap: lastCpap);
          }
        } catch (_) {
          print(_);
          yield HumidifierError(
              textError:
                  "Erreur lors de la récupération des données environmentales du patient");
        }
      } catch (_) {
        print(_);
        yield HumidifierError(
            textError:
                "Erreur lors de la récupération des données sur le dernier appareil utilisé par le patient");
      }
    } else if (event is SettingEvent) {
      yield* _settings(event, state);
    } else if (event is ValidateHumidifier) {
      try {
        _postSuggestedHumidifier(true, state);
      } catch (_) {
        yield HumidifierError(
            textError: "Erreur lors de l'enregistrement de votre choix");
      }
    } else if (event is RefuseHumidifier) {
      try {
        _postSuggestedHumidifier(false, state);
      } catch (_) {
        yield HumidifierError(
            textError: "Erreur lors de l'enregistrement de votre choix");
      }
    }
  }

  void _postSuggestedHumidifier(bool isAccepted, HumidifierSucced state) {
    repository.postHumidifier(new SuggestedHumidifier(
        renderedTreatmentId: state.lastCpap.renderedTreatmentId,
        treatmentId: state.lastCpap.treatmentId,
        date: DateTime.now(),
        humidifier:
            state is HumidifierSuggested ? state.settingHumidifier : null,
        patientId: state.patientId,
        isAccepted: isAccepted,
        isHumidifierSuggested: state is HumidifierSuggested,
        tubeTemperature:
            state is HumidifierSuggested ? state.settingTemp : null,
        techId: 1));
  }

  Stream<HumidifierState> _settings(
      SettingEvent event, HumidifierSuggested state) async* {
    if (event is PlusTemperature) {
      yield HumidifierSuggested(
          environmentalData: state.environmentalData,
          lastCpap: state.lastCpap,
          patientId: state.patientId,
          settingHumidifier: state.settingHumidifier,
          settingTemp: state.settingTemp + 1,
          textDescription: state.textDescription);
    } else if (event is MinusTemperature) {
      yield HumidifierSuggested(
          environmentalData: state.environmentalData,
          lastCpap: state.lastCpap,
          patientId: state.patientId,
          settingHumidifier: state.settingHumidifier,
          settingTemp: state.settingTemp - 1,
          textDescription: state.textDescription);
    } else if (event is MinusHumidifier) {
      yield HumidifierSuggested(
          environmentalData: state.environmentalData,
          lastCpap: state.lastCpap,
          patientId: state.patientId,
          settingHumidifier: state.settingHumidifier - 1,
          settingTemp: state.settingTemp,
          textDescription: state.textDescription);
    } else if (event is PlusHumidifier) {
      yield HumidifierSuggested(
          environmentalData: state.environmentalData,
          lastCpap: state.lastCpap,
          patientId: state.patientId,
          settingHumidifier: state.settingHumidifier + 1,
          settingTemp: state.settingTemp,
          textDescription: state.textDescription);
    }
  }
}
