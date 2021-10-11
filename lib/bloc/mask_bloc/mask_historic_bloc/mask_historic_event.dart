part of "mask_historic_bloc.dart";

abstract class MaskHistoricEvent extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}

class FetchMaskHistoric extends MaskHistoricEvent {
  final int patientId;

  FetchMaskHistoric({@required this.patientId});
}
