part of 'humidifier_bloc.dart';

abstract class HumidifierEvent extends Equatable {
  const HumidifierEvent();
  @override
  List<Object> get props => [];
}

abstract class SettingEvent extends HumidifierEvent {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class FetchPatientData extends HumidifierEvent {
  final int patientId;
  FetchPatientData({@required this.patientId});

  @override
  List<Object> get props => [patientId];
}

class PlusTemperature extends SettingEvent {}

class MinusTemperature extends SettingEvent {}

class PlusHumidifier extends SettingEvent {}

class MinusHumidifier extends SettingEvent {}

class ValidateHumidifier extends HumidifierEvent {}

class RefuseHumidifier extends HumidifierEvent {}
