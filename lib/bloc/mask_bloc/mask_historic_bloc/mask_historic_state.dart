part of "mask_historic_bloc.dart";

abstract class MaskHistoricState extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}

class MaskHistoricEmpty extends MaskHistoricState {}

class MaskHistoricLoading extends MaskHistoricState {}

class MaskHistoricLoaded extends MaskHistoricState {
  final List<MaskHistoric> listMask;
  final Mask suggestedMask;
  final int idPatient;

  MaskHistoricLoaded(
      {@required this.listMask,
      @required this.suggestedMask,
      @required this.idPatient});
}

class MaskHistoricError extends MaskHistoricState {}
