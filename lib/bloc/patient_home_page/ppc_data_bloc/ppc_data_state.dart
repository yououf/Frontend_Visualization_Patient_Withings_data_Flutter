part of 'ppc_data_bloc.dart';

abstract class PpcDataState extends Equatable {
  const PpcDataState();

  @override
  List<Object> get props => [];
}

class PpcDataInitial extends PpcDataState {}

class PpcDataLoading extends PpcDataState {}

class PpcDataError extends PpcDataState {}

class PpcDataLoaded extends PpcDataState {
  final List<Measure> listMeasure;
  final String range;
  final String dataType;

  PpcDataLoaded(
      {@required this.listMeasure,
      @required this.range,
      @required this.dataType});

  @override
  List<Object> get props => [listMeasure, range, dataType];
}
