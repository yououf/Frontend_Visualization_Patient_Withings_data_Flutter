import 'dart:async';

import 'package:DIH4CPS_APP/models/technician.dart';
import 'package:DIH4CPS_APP/services/technician_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:flutter/material.dart';

part 'patient_selection_event.dart';

part 'patient_selection_state.dart';

class PatientSelectionBloc
    extends Bloc<PatientSelectionEvent, PatientSelectionState> {
  final TechnicianRepository repository;

  PatientSelectionBloc({@required this.repository})
      : super(PatientSelectionInitial());

  @override
  Stream<PatientSelectionState> mapEventToState(
    PatientSelectionEvent event,
  ) async* {
    PatientSelectionState currentState = state;
    yield PatientSelectionLoading();
    if (event is FetchTechnicianTrip) {
      try {
        // List<Intervention> listInterventions =
        //     await repository.fetchTripTechnician(event.technicianId,
        //         FormatDate.formatter4.format(DateTime.now()));
        List<Intervention> listInterventions = await repository
            .fetchTripTechnician(event.technicianId, "2020-09-21"); // to change
        yield PatientSelectionLoaded(listInterventions: listInterventions);
      } on Exception catch (_) {
        yield PatientSelectionError();
      }
    }
    if (event is PickPatient) {
      if (currentState is PatientSelectionLoaded) {
        Intervention interventionPick = currentState.listInterventions
            .firstWhere(
                (intervention) => intervention.patientId == event.patientId);

        List<Intervention> listInterventions = currentState.listInterventions;

        listInterventions.remove(interventionPick);

        Intervention intervention = new Intervention(
          addressId: interventionPick.addressId,
          agreed: interventionPick.agreed,
          comment: interventionPick.comment,
          deliveryWindEnd: interventionPick.deliveryWindEnd,
          deliveryWindStart: interventionPick.deliveryWindStart,
          duration: interventionPick.duration,
          forecastedDate: interventionPick.forecastedDate,
          interventionId: interventionPick.interventionId,
          lastOptimizationDate: interventionPick.lastOptimizationDate,
          letter: interventionPick.letter,
          letterSent: interventionPick.letterSent,
          mandatoryTechId: interventionPick.mandatoryTechId,
          modemIssue: interventionPick.modemIssue,
          newTttReason: interventionPick.newTttReason,
          noModem: interventionPick.noModem,
          onHold: interventionPick.onHold,
          onHoldUntil: interventionPick.onHoldUntil,
          optimizationCount: interventionPick.optimizationCount,
          orderInTrip: interventionPick.orderInTrip,
          pathology: interventionPick.pathology,
          patientId: interventionPick.patientId,
          pdaStatus: interventionPick.pdaStatus,
          prescId: interventionPick.prescId,
          regionId: interventionPick.regionId,
          renderedTreatmentId: interventionPick.renderedTreatmentId,
          requestId: interventionPick.requestId,
          serviceType: interventionPick.serviceType,
          site: interventionPick.site,
          smsStatus: interventionPick.smsStatus,
          status: interventionPick.status,
          tRCRealizationDate: interventionPick.tRCRealizationDate,
          therapy: interventionPick.therapy,
          trcAgreed: interventionPick.trcAgreed,
          trcComment: interventionPick.trcComment,
          trcForecastedDate: interventionPick.trcForecastedDate,
          treatmentId: interventionPick.treatmentId,
          treatmentStatus: interventionPick.treatmentStatus,
          trip: interventionPick.trip,
          tripId: interventionPick.tripId,
          hasBeenClicked: true,
        );

        listInterventions.add(intervention);

        yield PatientSelectionLoaded(
            listInterventions: listInterventions, patientId: event.patientId);
      }
    }
  }
}
