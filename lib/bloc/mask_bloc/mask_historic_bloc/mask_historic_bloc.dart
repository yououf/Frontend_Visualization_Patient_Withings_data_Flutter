import 'dart:async';

import 'package:DIH4CPS_APP/models/mask.dart';
import 'package:DIH4CPS_APP/services/mask_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'mask_historic_event.dart';

part 'mask_historic_state.dart';

class MaskHistoricBloc extends Bloc<MaskHistoricEvent, MaskHistoricState> {
  final MaskRepository repository;

  MaskHistoricBloc({@required this.repository}) : super(MaskHistoricEmpty());

  @override
  Stream<MaskHistoricState> mapEventToState(
    MaskHistoricEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchMaskHistoric) {
      if (currentState is MaskHistoricLoaded)
        print(currentState.listMask.length);
      yield MaskHistoricLoading();
      try {
        final List<MaskHistoric> listMask =
            await repository.fetchHistoricMask(event.patientId);
        final Mask mask = await repository.fetchSuggestedMask(event.patientId);

        yield MaskHistoricLoaded(
            listMask: listMask,
            suggestedMask: mask,
            idPatient: event.patientId);
      } catch (_) {
        yield MaskHistoricError();
      }
    }
  }
}
