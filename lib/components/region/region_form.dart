import 'package:DIH4CPS_APP/bloc/bloc.dart';

import 'package:DIH4CPS_APP/components/region/region_dropdown.dart';
import 'package:DIH4CPS_APP/services/region_repository.dart';
import 'package:DIH4CPS_APP/style/style.dart';
import 'package:DIH4CPS_APP/utils/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';

import 'region_type_dropdown.dart';

class MyAppRegionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionFormBloc, RegionFormState>(
        builder: (context, state) {
      if (state is RegionFormStateLoading) {
        return Column(
          children: [
            BlocProvider<RegionsZipCodeBloc>(
              create: (context) => BlocProvider.of<RegionsZipCodeBloc>(context),
              child: MyAppDropDownButtonTypeRegion(),
            ),
            BlocProvider<RegionsBloc>(
              create: (context) => BlocProvider.of<RegionsBloc>(context),
              child: MyAppDropDownButtonRegion(),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: TextButton(
                      onPressed: () async {
                        DateTime beginDate = await showDatePicker(
                          context: context,
                          locale: const Locale("fr", "FR"),
                          initialDate: DateTime(2020, 09, 29),
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime(2020, 09, 29),
                        );
                        if (beginDate == null) beginDate = state.beginDate;
                        BlocProvider.of<RegionFormBloc>(context).add(
                          AddElement(
                            regionName: state.regionName,
                            beginDate: beginDate,
                            endDate: state.endDate,
                          ),
                        );
                      },
                      child: Text(
                        "Début: " + FormatDate.formatter.format(state.beginDate),
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                Card(
                  child: TextButton(
                      onPressed: () async {
                        DateTime endDate = await showDatePicker(
                          context: context,
                          locale: const Locale("fr", "FR"),
                          initialDate: DateTime(2020, 09, 29),
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime(2020, 09, 29),
                        );
                        if (endDate == null) endDate = state.endDate;
                        BlocProvider.of<RegionFormBloc>(context).add(
                          AddElement(
                            regionName: state.regionName,
                            beginDate: state.beginDate,
                            endDate: endDate,
                          ),
                        );
                      },
                      child: Text(
                        "Fin: " + FormatDate.formatter.format(state.endDate),
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: Style.refuseButtonColor,
                    onPressed: () => Navigator.pop(context),
                    child: Text("Retour"),
                  ),
                  RaisedButton(
                    color: Style.validateButtonColor,
                    onPressed: () {
                      BlocProvider.of<RegionFormBloc>(context).add(
                        FormValidated(
                          beginDate: state.beginDate,
                          endDate: state.endDate,
                          regionName: state.regionName,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Text("Valider"),
                  ),
                ],
              ),
            )
          ],
        );
      } else if (state is RegionFormStateLoaded) {
        BlocProvider.of<RegionFormBloc>(context).add(
          AddElement(
            beginDate: state.beginDate,
            endDate: state.endDate,
            regionName: state.regionName,
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

void showPopUpRegion(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: 300,
          margin: const EdgeInsets.only(top: 20),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<RegionsZipCodeBloc>(
                create: (BuildContext context) =>
                    RegionsZipCodeBloc(repository: RegionRepository()),
              ),
              BlocProvider<RegionsBloc>(
                create: (BuildContext context) => RegionsBloc(
                    bloc: BlocProvider.of<RegionsZipCodeBloc>(context)),
              ),
            ],
            child: MyAppRegionForm(),
          ),
        ),
      );
    },
  );
}
