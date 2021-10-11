import 'dart:async';

import 'package:DIH4CPS_APP/bloc/regions/patient_form_bloc/patient_form_bloc.dart';
import 'package:DIH4CPS_APP/bloc/regions/patient_form_bloc/patient_form_state.dart';

import 'package:DIH4CPS_APP/bloc/regions/region_form_bloc/region_form_bloc.dart';
import 'package:DIH4CPS_APP/bloc/regions/region_form_bloc/region_form_state.dart';

import 'package:DIH4CPS_APP/bloc/regions/region_graph/region_graph_event.dart';
import 'package:DIH4CPS_APP/bloc/regions/region_graph/region_graph_state.dart';
import 'package:DIH4CPS_APP/components/region/region_graph.dart';

import 'package:DIH4CPS_APP/models/measures.dart';

import 'package:DIH4CPS_APP/services/patient_repository.dart';
import 'package:DIH4CPS_APP/services/region_repository.dart';
import 'package:DIH4CPS_APP/utils/date_format.dart';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  final PatientFormBloc blocPatientForm;
  final RegionFormBloc blocRegionForm;
  final PatientRepository repositoryPatient;
  final RegionRepository repositoryRegion;

  StreamSubscription patientSubscription;
  StreamSubscription regionSubscription;

  GraphBloc(
      {@required this.blocPatientForm,
      @required this.repositoryPatient,
      @required this.repositoryRegion,
      @required this.blocRegionForm})
      : super(
          GraphStateEmpty(
            beginText:
                "Grâce à cette fonctionnalité vous avez la possibilité en tant que manager d'obtenir des informations sur le sommeil des patients de "
                "votre région.\n\nAinsi vous pouvez guider les techniciens pour aider les patients en leurs proposant des solutions adaptées pour augmenter la qualitée du "
                "sommeil.",
          ),
        ) {
    patientSubscription = blocPatientForm.listen((state) {
      if (state is PatientFormStateLoaded) {
        add(FetchGraphPatient(
            idPatient: state.patientId,
            beginDate: state.beginDate,
            endDate: state.endDate));
      }
    });

    regionSubscription = blocRegionForm.listen((state) {
      if (state is RegionFormStateLoaded) {
        add(FetchGraphRegion(
            regionName: state.regionName,
            beginDate: state.beginDate,
            endDate: state.endDate));
      }
    });
  }

  @override
  Stream<GraphState> mapEventToState(GraphEvent event) async* {
    if (event is FetchGraphPatient) {
      yield GraphStateLoading();
      try {
        String dateDebutString = FormatDate.formatter2.format(event.beginDate);
        String dateFinString = FormatDate.formatter2.format(event.endDate);
        final List<Measure> patientMeasures =
            await repositoryPatient.fetchPatientMeasuresById(
                event.idPatient, dateDebutString, dateFinString, "score");

        final String regionName =
            await repositoryPatient.fetchRegionPatient(event.idPatient);

        final List<Measure> regionMeasures =
            await repositoryRegion.fetchRegionMeasuresById(
                regionName, event.beginDate, event.endDate);

        var dataPatient = SimpleTimeSeriesChart.createSampleData(
            patientMeasures, regionMeasures);

        yield GraphStateLoadedPatient(
          idPatient: event.idPatient,
          seriesListPatient: dataPatient,
          seriesListRegion: dataPatient,
          regionName: null,
        );
      } catch (_) {
        yield RegionGraphStateError(errorText: "Données non disponibles");
      }
    }
    if (event is FetchGraphRegion) {
      yield GraphStateLoading();
      try {
        final List<Measure> regionMeasures =
            await repositoryRegion.fetchRegionMeasuresById(
                event.regionName, event.beginDate, event.endDate);

        final List<Measure> regionsAhi =
            await repositoryRegion.fetchRegionAhiById(
                event.regionName, event.beginDate, event.endDate);

        final List<Measure> regionsCompliance =
            await repositoryRegion.fetchRegionComplianceById(
                event.regionName, event.beginDate, event.endDate);

        final List<Measure> regionsLeakage =
            await repositoryRegion.fetchRegionLeakageById(
                event.regionName, event.beginDate, event.endDate);

        var dataRegion = SimpleTimeSeriesChart.createSampleRegion(
            regionMeasures, regionsAhi, regionsCompliance, regionsLeakage);

        yield GraphStateLoadedRegion(
          regionName: event.regionName,
          seriesListScore: dataRegion,
          seriesListAhi: [],
          seriesListCompliance: [],
          seriesListLeakage: [],
        );
      } catch (_) {
        yield RegionGraphStateError(errorText: "Données non disponibles");
      }
    }
  }

  Future<void> close() {
    patientSubscription.cancel();
    regionSubscription.cancel();
    return super.close();
  }
}
