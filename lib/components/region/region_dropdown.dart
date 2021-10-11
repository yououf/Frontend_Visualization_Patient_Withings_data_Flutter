import 'package:DIH4CPS_APP/bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';

class MyAppDropDownButtonRegion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionsBloc, RegionsState>(builder: (context, state) {
      if (state is RegionsLoaded) {
        final List<String> regionsName =
            state.regions.map((e) => e.regionName).toList();
        final String value = state.nameRegion;

        var stateRegionForm = BlocProvider.of<RegionFormBloc>(context).state;
        if (stateRegionForm is RegionFormStateLoading) {
          BlocProvider.of<RegionFormBloc>(context).add(
            AddElement(
              regionName: value,
              beginDate: stateRegionForm.beginDate,
              endDate: stateRegionForm.endDate,
            ),
          );
        }

        return Column(
          children: [
            Text("Veuilez choisir une région"),
            DropdownButton<String>(
              value: value,
              onChanged: (String newValue) {
                BlocProvider.of<RegionsBloc>(context).add(ChangeRegionSelected(
                    listRegions: state.regions, region: newValue));
              },
              items: regionsName.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      child: Text(value),
                    ));
              }).toList(),
            )
          ],
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
