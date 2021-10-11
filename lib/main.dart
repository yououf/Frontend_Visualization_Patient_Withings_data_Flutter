import 'package:DIH4CPS_APP/services/technician_repository.dart';
import 'package:DIH4CPS_APP/style/linde_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/init.dart';
import 'services/repository.dart';
import 'bloc/bloc.dart';
import 'view/view.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<RegionFormBloc>(
      create: (BuildContext context) => RegionFormBloc(),
    ),
    BlocProvider<PatientFormBloc>(
      create: (BuildContext context) => PatientFormBloc(),
    ),
    BlocProvider<GraphBloc>(
      create: (BuildContext context) => GraphBloc(
        blocPatientForm: BlocProvider.of<PatientFormBloc>(context),
        blocRegionForm: BlocProvider.of<RegionFormBloc>(context),
        repositoryPatient: PatientRepository(),
        repositoryRegion: RegionRepository(),
      ),
    ),
    BlocProvider<PatientBloc>(
      create: (BuildContext context) =>
          PatientBloc(repository: PatientRepository()),
    ),
    BlocProvider<MaskHistoricBloc>(
      create: (BuildContext context) =>
          MaskHistoricBloc(repository: MaskRepository()),
    ),
    BlocProvider<SuggestedMaskBloc>(
      create: (BuildContext context) =>
          SuggestedMaskBloc(repository: MaskRepository()),
    ),
    BlocProvider<MaskBloc>(
      create: (BuildContext context) => MaskBloc(repository: MaskRepository()),
    ),
    BlocProvider<HumidifierBloc>(
      create: (BuildContext context) => HumidifierBloc(
          repository: HumidifierRepository(),
          repositoryDataPatient: DataPatientRepository()),
    ),
    BlocProvider<HumidifierQuestionsBloc>(
      create: (BuildContext context) =>
          HumidifierQuestionsBloc(repository: HumidifierRepository()),
    ),
    BlocProvider<PatientSelectionBloc>(
        create: (BuildContext context) =>
            PatientSelectionBloc(repository: TechnicianRepository()))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key key});

  @override
  Widget build(BuildContext context) {
    precacheImage(
        AssetImage("assets/images/linde_logo/LINDE_LOGO.jpg"), context);
    return MaterialApp(
      theme: LindeTheme().theme,
      debugShowCheckedModeBanner: false,
      title: 'DIH4CPS',
      routes: {
        '/home_page': (context) => MyHomePage(),
        '/region': (context) => MyAppRegion(),
        '/patient_selection': (context) => MyAppPatientSelection(),
        '/mask_suggestion': (context) => MyAppMaskSuggestion(),
        '/mask_delivery': (context) => MyAppMaskDelivery(),
        '/mask_selection': (context) => MyAppMaskSelection(),
        '/humidifier': (context) => MyAppHumidifier(),
        '/humidifier_questions': (context) => MyAppHumidifierQuestions(),
        '/patient_environment': (context) => MyAppPatientEnvironment(),
      },
      initialRoute: '/patient_selection',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en'), const Locale('fr')],
    );
  }
}
