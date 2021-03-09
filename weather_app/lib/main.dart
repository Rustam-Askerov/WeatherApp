import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/UserStates.dart';
import 'generated/l10n.dart';
import 'home_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserStates>(create: (context) => UserStates(),
    child: MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      home: HomePage()
      ),
    );
  }
}
