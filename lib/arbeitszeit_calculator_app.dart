import "package:arbeitszeit_calculator_flutter/app_dependencies.dart";
import "package:arbeitszeit_calculator_flutter/navigation/router.dart";
import "package:arbeitszeit_calculator_flutter/theme/app_theme.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";

class ArbeitszeitCalculatorApp extends StatelessWidget {
  const ArbeitszeitCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      app: MaterialApp.router(
        title: "Arbeitszeit Calculator",
        theme: getAppTheme(context),
        routerConfig: router,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("en"), // English
          Locale("de"), // German
        ],
      ),
    );
  }
}
