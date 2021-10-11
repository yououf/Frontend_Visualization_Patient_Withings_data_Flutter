import 'dart:async';
import 'package:bloc/bloc.dart';
import 'region_form_event.dart';
import 'region_form_state.dart';

class RegionFormBloc extends Bloc<RegionFormEvent, RegionFormState> {
  RegionFormBloc()
      : super(RegionFormStateLoading(
          regionName: "DR_Est",
          endDate: DateTime(2020, 09, 29),
          beginDate: DateTime(2020, 09, 29),
        ));

  @override
  Stream<RegionFormState> mapEventToState(
    RegionFormEvent event,
  ) async* {
    if (event is AddElement) {
      yield RegionFormStateLoading(
          regionName: event.regionName,
          endDate: event.endDate,
          beginDate: event.beginDate);
    }
    if (event is FormValidated) {
      yield RegionFormStateLoaded(
          regionName: event.regionName,
          endDate: event.endDate,
          beginDate: event.beginDate);
    }
  }
}
