part of 'suggested_mask_bloc.dart';

abstract class SuggestedMaskEvent extends Equatable {}

class AcceptedSuggestedMaskEvent extends SuggestedMaskEvent {
  final Mask mask;
  final int patientId;

  AcceptedSuggestedMaskEvent({@required this.mask, @required this.patientId});

  @override
  List<Object> get props => [mask, patientId];
}

class SelectedMaskEvent extends SuggestedMaskEvent {
  final Mask mask;

  SelectedMaskEvent({@required this.mask});

  @override
  List<Object> get props => [mask];
}

class RefusedSuggestedMaskEvent extends SuggestedMaskEvent {
  final String refusedMaskId;
  final int patientId;

  RefusedSuggestedMaskEvent(
      {@required this.refusedMaskId, @required this.patientId});

  @override
  List<Object> get props => [patientId, refusedMaskId];
}
