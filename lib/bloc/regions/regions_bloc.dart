import 'dart:async';

import 'package:DIH4CPS_APP/bloc/regions/regions_event.dart';
import 'package:DIH4CPS_APP/bloc/regions/regions_state.dart';
import 'package:DIH4CPS_APP/models/region.dart';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../../models/region.dart';
import '../bloc.dart';

class RegionsBloc extends Bloc<RegionsEvent, RegionsState> {
  final RegionsZipCodeBloc bloc;
  StreamSubscription blocSubscription;

  RegionsBloc({@required this.bloc})
      : super(
          RegionsEmpty(),
        ) {
    blocSubscription = bloc.listen((state) {
      if (state is RegionsZipCodesStatesLoaded) {
        add(
          FetchRegions(typeNameRegion: state.typeName, region: null),
        );
      }
    });
  }

  @override
  Stream<RegionsState> mapEventToState(RegionsEvent event) async* {
    if (event is FetchRegions) {
      final String typeNameRegion = event.typeNameRegion;
      yield RegionsLoading();
      try {
        final List<Region> listRegions =
            await bloc.repository.fetchRegionsByTypeNameRegion(typeNameRegion);
        yield RegionsLoaded(
            regions: listRegions, nameRegion: listRegions[0].regionName);
      } catch (_) {
        yield RegionsError();
      }
    }
    if (event is ChangeRegionSelected) {
      final String regionSelected = event.region;
      final List<Region> listRegions = event.listRegions;
      yield RegionsLoaded(regions: listRegions, nameRegion: regionSelected);
    }
  }

  Future<void> close() {
    blocSubscription.cancel();
    return super.close();
  }
}
