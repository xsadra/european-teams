import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'club/presentation/bloc/club/bloc.dart';
import 'club/presentation/pages/pages.dart';
import 'club/presentation/routes.dart';
import 'core/constants/colors.dart';
import 'core/constants/texts.dart';
import 'injection_container.dart' as injection;
import 'injection_container.dart';
import 'locale/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  Routes.createRoutes();
  runApp(Main());
}

class Main extends StatelessWidget {
  final AppLocalizationDelegate _localeOverrideDelegate =
      const AppLocalizationDelegate(Locale(EN, US));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      theme: ThemeData().copyWith(primaryColor: kColorMain),
      home: BlocProvider(
        create: (context) => sl<ClubBloc>(),
        child: ClubsPage(),
      ),
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
      supportedLocales: _supportedLocales(),
      localizationsDelegates: _localizationsDelegates(),
    );
  }

  List<Locale> _supportedLocales() => const [
        Locale(EN, GB),
        Locale(DE, AT),
        Locale(DE, DE),
        Locale(PL, PL),
      ];

  List<LocalizationsDelegate> _localizationsDelegates() => [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        _localeOverrideDelegate
      ];
}
