import 'package:DIH4CPS_APP/components/mask_list.dart';
import 'package:DIH4CPS_APP/models/mask.dart';
import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:DIH4CPS_APP/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DIH4CPS_APP/bloc/bloc.dart';

class MyAppMaskSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<MaskBloc, MaskState>(builder: (context, state) {
          if (state is MaskStateEmpty) {
            BlocProvider.of<MaskBloc>(context).add(FetchAllMask());
          }
          if (state is MaskStateLoaded) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Masques nasaux: ",
                    style: lindeDarkText,
                  ),
                ),
                MyAppMaskList(
                  maskList: state.listMaskNasal,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Masques faciaux: ",
                    style: lindeDarkText,
                  ),
                ),
                MyAppMaskList(
                  maskList: state.listFaceMask,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Masques narinaires: ",
                    style: lindeDarkText,
                  ),
                ),
                MyAppMaskList(
                  maskList: state.nasalPillowMask,
                ),
              ],
            );
          } else if (state is MaskStateLoading)
            return const Center(
              child: const CircularProgressIndicator(),
            );
          return Center(
            child: Text("Erreur lors de l'affichage des masks"),
          );
        }),
        appBar: AppBar(
          title: FittedBox(
            child: Text("Sélection d'un nouveau masque"),
            fit: BoxFit.contain,
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
