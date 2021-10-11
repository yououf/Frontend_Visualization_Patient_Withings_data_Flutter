import 'dart:async';

import 'package:DIH4CPS_APP/models/mask.dart';
import 'package:DIH4CPS_APP/services/mask_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'suggested_mask_event.dart';

part 'suggested_mask_state.dart';

class SuggestedMaskBloc extends Bloc<SuggestedMaskEvent, SuggestedMaskState> {
  final MaskRepository repository;

  SuggestedMaskBloc({@required this.repository})
      : super(
          SuggestedMaskEmpty(),
        );

  @override
  Stream<SuggestedMaskState> mapEventToState(
    SuggestedMaskEvent event,
  ) async* {
    final currentState = state;
    if (event is AcceptedSuggestedMaskEvent) {
      yield* _loadingMask(event.mask.id, event.mask.id, event.patientId, true,
          event.mask.description);
    }
    if (event is RefusedSuggestedMaskEvent) {
      yield SuggestedMaskRefused(
        maskId: event.refusedMaskId,
        patientId: event.patientId,
      );
    }
    if (event is SelectedMaskEvent) {
      if (currentState is SuggestedMaskRefused) {
        yield* _loadingMask(event.mask.id, currentState.maskId,
            currentState.patientId, false, event.mask.description);
      } else
        yield SuggestedMaskError();
    }
  }

  Stream<SuggestedMaskState> _loadingMask(String maskId, String maskSuggestedId,
      int patientId, bool isValidated, String maskName) async* {
    yield SuggestedMaskLoading();
    final suggestedMask = new SuggestedMask(
        patientId: patientId,
        date: DateTime.now(),
        isAccepted: isValidated,
        maskSelectedId: maskId,
        maskSuggestedId: maskSuggestedId,
        techId: 1);

    try {
      await repository.postMask(suggestedMask);
      yield SuggestedMaskLoaded(
          maskName: maskName,
          patientId: suggestedMask.patientId.toString(),
          maskId: maskId);
    } catch (_) {
      yield SuggestedMaskError();
    }
  }
}
