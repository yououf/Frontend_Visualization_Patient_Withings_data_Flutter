part of 'humidifier_bloc.dart';

abstract class HumidifierState extends Equatable {
  final int patientId;
  const HumidifierState({this.patientId});
}

class HumidifierError extends HumidifierState {
  final String textError;
  const HumidifierError({@required this.textError, int patientId})
      : super(patientId: patientId);

  @override
  List<Object> get props => [textError, patientId];
}

abstract class HumidifierSucced extends HumidifierState {
  final String textDescription;
  final List<DataPatient> environmentalData;
  final Cpap lastCpap;

  HumidifierSucced(
      {@required int patientId,
      @required this.environmentalData,
      @required this.lastCpap,
      @required this.textDescription})
      : super(patientId: patientId);
}

class HumidifierEmpty extends HumidifierState {
  @override
  List<Object> get props => [];
}

class HumidifierLoading extends HumidifierState {
  @override
  List<Object> get props => [];
}

class HumidifierSuggested extends HumidifierSucced {
  final int settingTemp;
  final int settingHumidifier;

  HumidifierSuggested(
      {@required List<DataPatient> environmentalData,
      @required Cpap lastCpap,
      @required int patientId,
      @required this.settingHumidifier,
      @required this.settingTemp,
      @required String textDescription})
      : super(
            patientId: patientId,
            environmentalData: environmentalData,
            lastCpap: lastCpap,
            textDescription: textDescription);

  @override
  List<Object> get props => [
        lastCpap,
        patientId,
        environmentalData,
        textDescription,
        settingTemp,
        settingHumidifier,
        patientId
      ];
}

class HumidifierNotSuggested extends HumidifierSucced {
  HumidifierNotSuggested(
      {@required String descriptionText,
      @required List<DataPatient> environmentalData,
      @required int patientId,
      @required Cpap lastCpap})
      : super(
            patientId: patientId,
            environmentalData: environmentalData,
            lastCpap: lastCpap,
            textDescription: descriptionText);

  @override
  List<Object> get props => [
        patientId,
        environmentalData,
        lastCpap,
        textDescription,
      ];
}
