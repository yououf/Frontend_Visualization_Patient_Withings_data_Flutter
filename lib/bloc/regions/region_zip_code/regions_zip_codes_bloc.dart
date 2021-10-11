import 'package:DIH4CPS_APP/bloc/regions/region_zip_code/regions_zip_codes_event.dart';
import 'package:DIH4CPS_APP/bloc/regions/region_zip_code/regions_zip_codes_state.dart';
import 'package:DIH4CPS_APP/models/region.dart';
import 'package:DIH4CPS_APP/services/region_repository.dart';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class RegionsZipCodeBloc
    extends Bloc<RegionsZipCodesEvent, RegionsZipCodesState> {
  final RegionRepository repository;

  RegionsZipCodeBloc({@required this.repository})
      : assert(repository != null),
        super(
          RegionsZipCodesStateEmpty(),
        );

  @override
  Stream<RegionsZipCodesState> mapEventToState(
      RegionsZipCodesEvent event) async* {
    if (event is FetchRegionsZipCodes) {
      yield RegionsZipCodesStateLoading();
      try {
        final List<RegionZipCodesIdName> regionZipCodesIdName =
            await repository.fetchRegionsZipCodesIdName();
        yield RegionsZipCodesStatesLoaded(
            regionZipCodesIdName: regionZipCodesIdName,
            typeName: event.typeName);
      } catch (_) {
        yield RegionsZipCodesStatesError();
      }
    }
  }
}
