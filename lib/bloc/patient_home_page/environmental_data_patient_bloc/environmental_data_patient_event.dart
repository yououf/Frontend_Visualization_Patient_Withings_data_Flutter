part of 'environmental_data_patient_bloc.dart';

@immutable
abstract class EnvironmentalDataPatientEvent extends Equatable {
  final int idPatient;
  final String dataType;

  EnvironmentalDataPatientEvent({this.idPatient, this.dataType});

  @override
  List<Object> get props => [idPatient, dataType];
}

abstract class EnvironmentalDataPatientIndOutDoor
    extends EnvironmentalDataPatientEvent {
  EnvironmentalDataPatientIndOutDoor({int idPatient, String dataType})
      : super(dataType: dataType, idPatient: idPatient);
}

class GetInDoorEnvironmentalDataPatient
    extends EnvironmentalDataPatientIndOutDoor {
  GetInDoorEnvironmentalDataPatient({int idPatient, String dataType})
      : super(idPatient: idPatient, dataType: dataType);
}

class GetOutDoorEnvironmentalDataPatient
    extends EnvironmentalDataPatientIndOutDoor {
  GetOutDoorEnvironmentalDataPatient({int idPatient, String dataType})
      : super(idPatient: idPatient, dataType: dataType);
}

class GetEnvironmentalDataPatient30Days extends EnvironmentalDataPatientEvent {
  GetEnvironmentalDataPatient30Days({int idPatient, String dataType})
      : super(idPatient: idPatient, dataType: dataType);
}

class GetEnvironmentalDataPatient90Days extends EnvironmentalDataPatientEvent {
  GetEnvironmentalDataPatient90Days({int idPatient, String dataType})
      : super(idPatient: idPatient, dataType: dataType);
}

class GetEnvironmentalDataPatient180Days extends EnvironmentalDataPatientEvent {
  GetEnvironmentalDataPatient180Days({int idPatient, String dataType})
      : super(idPatient: idPatient, dataType: dataType);
}
