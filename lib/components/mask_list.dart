import 'package:DIH4CPS_APP/bloc/bloc.dart';
import 'package:DIH4CPS_APP/models/mask.dart';
import 'package:DIH4CPS_APP/style/style.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAppMaskList extends StatelessWidget {
  final List<Mask> maskList;

  MyAppMaskList({@required this.maskList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: maskList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _buildAboutDialog(context, maskList[index]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Card(
                color: HexColor("#F3F6F7"),
                elevation: 8.0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 6.5,
                        width: MediaQuery.of(context).size.width / 3.2,
                        child: HttpRequest.getImg(
                            'img/masks/' + maskList[index].id + ".png",
                            "Masque " + maskList[index].id),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, right: 8.0, top: 8.0),
                            child: FittedBox(
                              child: Text(
                                maskList[index].description,
                                style: TextStyle(fontSize: 15.0),
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, right: 8.0),
                            child: FittedBox(
                              child: Text(
                                "Fabricant: " + maskList[index].provider,
                                style: TextStyle(fontSize: 14.0),
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, right: 8.0),
                            child: Text("Ref SAP: " + maskList[index].id),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 8.0),
                            child: FlatButton(
                              onPressed: () =>
                                  _buildAboutDialog(context, maskList[index]),
                              color: Colors.white,
                              child: const Text("Choisir"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> _buildAboutDialog(BuildContext context, Mask mask) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Validation',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Voulez vraiment choisir ce mask ?"),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Refuser"),
                    color: Style.refuseButtonColor,
                  ),
                  RaisedButton(
                    onPressed: () {
                      BlocProvider.of<SuggestedMaskBloc>(context)
                          .add(SelectedMaskEvent(mask: mask));
                      Navigator.pushNamed(context, '/mask_delivery');
                    },
                    child: Text("Valider"),
                    color: Style.validateButtonColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
