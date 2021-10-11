import 'package:DIH4CPS_APP/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';

class MyAppDropDownButtonTypeRegion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionsZipCodeBloc, RegionsZipCodesState>(
        builder: (context, state) {
      if (state is RegionsZipCodesStateEmpty) {
        BlocProvider.of<RegionsZipCodeBloc>(context)
            .add(FetchRegionsZipCodes(typeName: "Directions Régionales"));
      }
      if (state is RegionsZipCodesStatesLoaded) {
        // Get only region types names
        final List<String> regionTypeName =
            state.regionZipCodesIdName.map((e) => e.regionTypeName).toList();
        final String value = state.typeName;
        return Column(
          children: [
            Text("Veuillez choisir un type de région"),
            DropdownButton<String>(
              value: value,
              onChanged: (String newValue) {
                BlocProvider.of<RegionsZipCodeBloc>(context)
                    .add(FetchRegionsZipCodes(typeName: newValue));
              },
              items:
                  regionTypeName.map<DropdownMenuItem<String>>((String value) {
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
