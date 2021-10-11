part of 'ppc_data_bloc.dart';

abstract class PpcDataEvent extends Equatable {
  final int patientId;

  const PpcDataEvent({@required this.patientId});

  @override
  List<Object> get props => [patientId];
}

abstract class PpcGetData extends PpcDataEvent {
  final String dataType;

  PpcGetData({int idPatient, this.dataType}) : super(patientId: idPatient);

  @override
  List<Object> get props => [patientId, dataType];
}

class GetLeakage extends PpcGetData {
  GetLeakage({int idPatient})
      : super(idPatient: idPatient, dataType: "leakage");
}

class GetCompliance extends PpcGetData {
  GetCompliance({int idPatient})
      : super(idPatient: idPatient, dataType: "compliance");
}

class GetIAH extends PpcGetData {
  GetIAH({int idPatient}) : super(idPatient: idPatient, dataType: "ahi");
}

class GetPPCDataPatient7Days extends PpcDataEvent {
  GetPPCDataPatient7Days({int idPatient, String dataType})
      : super(patientId: idPatient);
}

class GetPPCDataPatient30Days extends PpcDataEvent {
  GetPPCDataPatient30Days({int idPatient}) : super(patientId: idPatient);
}

class GetPPCDataPatient90Days extends PpcDataEvent {
  GetPPCDataPatient90Days({int idPatient}) : super(patientId: idPatient);
}
