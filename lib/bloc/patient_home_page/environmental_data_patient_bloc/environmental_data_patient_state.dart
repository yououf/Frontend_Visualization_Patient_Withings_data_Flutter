part of 'environmental_data_patient_bloc.dart';

abstract class EnvironmentalDataPatientState extends Equatable {
  @override
  List<Object> get props => [];
}

class EnvironmentalDataPatientInitial extends EnvironmentalDataPatientState {}

class EnvironmentalDataPatientLoading extends EnvironmentalDataPatientState {}

abstract class EnvironmentalDataPatientLoaded
    extends EnvironmentalDataPatientState {
  final List<DataPatient> listData;
  final String range;

  EnvironmentalDataPatientLoaded({this.listData, this.range});

  @override
  List<Object> get props => [listData, range];
}

class EnvironmentalDataPatientLoadedInDoor
    extends EnvironmentalDataPatientLoaded {
  EnvironmentalDataPatientLoadedInDoor(
      {String range, List<DataPatient> listData})
      : super(range: range, listData: listData);
}

class EnvironmentalDataPatientLoadedOutDoor
    extends EnvironmentalDataPatientLoaded {
  EnvironmentalDataPatientLoadedOutDoor(
      {String range, List<DataPatient> listData})
      : super(range: range, listData: listData);
}

class EnvironmentalDataPatientError extends EnvironmentalDataPatientState {}
