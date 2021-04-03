import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(S.of(context).appBarTitle),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  setState(() {
                    S.load(Locale("en"));
                  });
                },
                color: Colors.blue,
                child: Text("Change to English"),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    S.load(Locale("ru"));
                  });
                },
                color: Colors.blue,
                child: Text("Change to Russian"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<http.Response> getData() async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  Uri url = Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=Derbent&appid=3711947e001af2ff0256db2d2033ffe0');
  var response = await http.get(url, headers: headers);
  return response;
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
