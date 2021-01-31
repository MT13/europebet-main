import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home_page.dart';

void main() {
  runApp(EuropeBetMain());
}

class EuropeBetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    // Orientation orientation = MediaQuery.of(context).orientation;

    return MaterialApp(
      title: 'EuropeBet',
      theme: ThemeData(
        colorScheme: ColorScheme(
          background: Color(0xFF1C1D1E),
          brightness: Brightness.dark,
          error: Colors.red,
          onError: Colors.white,
          onBackground: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          primary: Color(0xFF1C1D1E),
          primaryVariant: Color(0xFF1C1D1E),
          secondary: Color(0xFFEF602A),
          secondaryVariant: Color(0xFFF05A22),
          surface: Color(0xFF1C1D1E),
          onSurface: Colors.white,
        ),

        fontFamily: 'Helvetica',
        textTheme: TextTheme(
          button: TextStyle(fontSize: 12),
        )
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomePage(title: 'EuropeBet'),
    );
  }
}
