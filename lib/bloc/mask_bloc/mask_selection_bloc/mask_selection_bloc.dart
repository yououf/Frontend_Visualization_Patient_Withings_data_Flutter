import 'dart:async';

import 'package:DIH4CPS_APP/models/mask.dart';
import 'package:DIH4CPS_APP/services/mask_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


part 'mask_selection_event.dart';

part 'mask_selection_state.dart';

class MaskBloc extends Bloc<MaskEvent, MaskState> {
  final MaskRepository repository;

  MaskBloc({@required this.repository}) : super(MaskStateEmpty());

  @override
  Stream<MaskState> mapEventToState(
    MaskEvent event,
  ) async* {
    if (event is FetchAllMask) {
      yield MaskStateLoading();
      try {
        List<Mask> listNasalMask = await repository.fetchNasalMask();
        List<Mask> listFaceMask = await repository.fetchFaceMask();
        List<Mask> nasalPillowMask = await repository.fetchNasalPillowMask();
        yield MaskStateLoaded(
            listFaceMask: listFaceMask,
            listMaskNasal: listNasalMask,
            nasalPillowMask: nasalPillowMask);
      } catch (_) {
        yield MakeStateError();
      }
    }
  }
}
