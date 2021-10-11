
import 'package:DIH4CPS_APP/bloc/bloc.dart';
import 'package:DIH4CPS_APP/utils/date_format.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAppMaskHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaskHistoricBloc, MaskHistoricState>(
      builder: (context, state) {
        if (state is MaskHistoricLoading)
          return CircularProgressIndicator();
        else if (state is MaskHistoricLoaded)
          return Expanded(
            child: ListView.builder(
              itemCount: state.listMask.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 6.0),
                  child: Card(
                    color: HexColor("#F3F6F7"),
                    elevation: 8.0,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            height:
                            MediaQuery.of(context).size.height /
                                6.5,
                            width: MediaQuery.of(context).size.width /
                                3.2,
                            child: HttpRequest.getImg(
                                'img/masks/' +
                                    state.listMask[index].id +
                                    ".png",
                                "Masque " + state.listMask[index].id),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, right: 8.0),
                                child: FittedBox(
                                  child: Text(
                                    state.listMask[index].description,
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, right: 8.0),
                                child: FittedBox(
                                  child: Text(
                                    "Fabricant: " +
                                        state.listMask[index].provider,
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, right: 8.0),
                                child: Text(
                                    "Ref SAP: " + state.listMask[index].id),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, right: 8.0),
                                child: Text("Date livraison: " +
                                    FormatDate.formatter
                                        .format(state.listMask[index].date)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        else
          return Text("Il n'y a pas d'historique pour ce patient");
      },
    );
  }
}
