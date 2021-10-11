part of 'suggested_mask_bloc.dart';

abstract class SuggestedMaskState extends Equatable {}

class SuggestedMaskEmpty extends SuggestedMaskState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class SuggestedMaskLoading extends SuggestedMaskState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class SuggestedMaskLoaded extends SuggestedMaskState {
  final String maskName;
  final String patientId;
  final String maskId;

  SuggestedMaskLoaded(
      {@required this.maskName,
      @required this.patientId,
      @required this.maskId});

  @override
  List<Object> get props => [this.maskName, this.maskId];
}

class SuggestedMaskRefused extends SuggestedMaskState {
  final String maskId;
  final int patientId;

  SuggestedMaskRefused({@required this.maskId, @required this.patientId});

  @override
  List<Object> get props => [patientId, maskId];
}

class SuggestedMaskError extends SuggestedMaskState {
  @override
  List<Object> get props => throw UnimplementedError();
}
