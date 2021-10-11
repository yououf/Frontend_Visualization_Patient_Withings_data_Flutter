part of "mask_selection_bloc.dart";

abstract class MaskState extends Equatable {}

class MaskStateEmpty extends MaskState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class MaskStateLoading extends MaskState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class MaskStateLoaded extends MaskState {
  final List<Mask> listMaskNasal;
  final List<Mask> listFaceMask;
  final List<Mask> nasalPillowMask;

  MaskStateLoaded(
      {@required this.listMaskNasal,
      @required this.listFaceMask,
      @required this.nasalPillowMask});

  @override
  List<Object> get props => [listFaceMask, listMaskNasal, nasalPillowMask];
}

class MakeStateError extends MaskState {
  @override
  List<Object> get props => throw UnimplementedError();
}
