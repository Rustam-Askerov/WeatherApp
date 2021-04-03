import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/UserStates.dart';
import 'package:weather_app/load_screen.dart';
import 'generated/l10n.dart';
import 'home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/home_page': (BuildContext context) => HomePage(),
  };
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserStates>(
      create: (context) => UserStates(),
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          // GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: LoadScreen(
          nextRoute: '/home_page',
        ),
        routes: routes,
      ),
    );
  }
}

/* Future<http.Response> getData() async {
  Uri url = Uri.parse(
      'http://api.openweathermap.org/data/2.5/weather?q=Derbent&appid=3711947e001af2ff0256db2d2033ffe0');
  return await http.get(url);
}

void loadData() {
  getData()
      .then((response) => {
            if (response.statusCode == 200)
              {print(response.body)}
            else
              {print(response.statusCode)}
          })
      .catchError((error) {
    debugPrint(error.toString());
  });
}
 */