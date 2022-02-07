import 'package:flutter/material.dart';
import 'package:theweatherapp/card.dart';
import 'package:theweatherapp/new_city_form.dart';
import 'package:theweatherapp/theme_config.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:country_list_pick/country_list_pick.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

ThemeData buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    buttonColor: Color(theme[1]),
    cardColor: Color(theme2[1]),
    backgroundColor: Color(bgSecondary[1]),
    primaryColor: Color(theme[1]),
    accentColor: Color(theme[1]),
    scaffoldBackgroundColor: Color(bgPrimary[1]),
  );
}

ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    buttonColor: Color(theme[0]),
    cardColor: Color(theme2[0]),
    backgroundColor: Color(bgSecondary[0]),
    primaryColor: Color(theme[0]),
    accentColor: Color(theme[0]),
    scaffoldBackgroundColor: Color(bgPrimary[0]),
  );
}

List<Widget> cityTileList = [
  CityCard(
    cityName: "Boston",
    cityID: 100,
    cityLocation: "USA",
  ),
  CityCard(
    cityName: "Toronto",
    cityID: 100,
    cityLocation: "Canada",
  ),
];

void main() {
  runApp(const MyApp());
}

var cityList = [];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Weather App',
      theme: ThemeData(
        cardColor: Color(theme2[theme_index]),
        //primarySwatch: Color(theme[theme_index],
        scaffoldBackgroundColor: Color(bgPrimary[theme_index]),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: 'NewCityFormTag',
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewCityForm(),
                ));
          }),
      /*FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                cityTileList.add(
                  CityCard(
                    cityName: "Mumbai",
                    cityID: 21,
                    cityLocation: "India",
                  ),
                );
              });
            }),*/
      appBar: AppBar(
        backgroundColor: Color(theme[theme_index]),
        title: const Text('The Weather App'),
        actions: [
          IconButton(
              icon: Icon(Icons.wb_sunny),
              onPressed: () {
                setState(() {
                  if (theme_index == 0) {
                    theme_index = 1;
                  } else {
                    theme_index = 0;
                  }
                });
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemBuilder: (listViewContext, index) {
            return cityTileList[index];
          },
          itemCount: cityTileList.length,
        ),
      ),
    );
  }
}

//import 'package:autocomplete_textfield/autocomplete_textfield.dart';

TextEditingController cityController = new TextEditingController();
TextEditingController countryController = new TextEditingController();

class NewCityForm extends StatefulWidget {
  @override
  State<NewCityForm> createState() => _NewCityFormState();
}

class _NewCityFormState extends State<NewCityForm> {
  String city_name = '';
  String city_country = '';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void submitForm() {}

  Future<String> getData(city_name, city_country) async {
    http.Response response = await http.get(Uri.parse("http://url.org"),
        headers: {"Accept": "application/json"});
    print(response.body);
    cityTileList.add(
      CityCard(cityName: city_name, cityLocation: city_country, cityID: 0),
    );

    //List data = JSON.decode(response.body);
    return response.body;
  }

  void addCard(city_name, city_country) {
    cityTileList.add(
      CityCard(cityName: city_name, cityLocation: city_country, cityID: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a New City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                //MaterialTextInputCity(),
                //MaterialTextInputState(),
                buildCity(),
                buildCountry(),
                buildSubmit(),
                //MaterialTextInput(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String currentText_city = '';
  String currentText_country = '';

  Widget buildCity() => Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: cityController,
          style: TextStyle(color: Color(textSecondary[theme_index])),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter your City",
            prefixIcon: Icon(Icons.location_city),
          ),
          onChanged: (text) => setState(() {
            String currentText_city = text;
            this.city_name = text;
          }),
          onSaved: (text) => setState(() {
            this.city_name = text!;
          }),
        ),
        Text(currentText_city),
      ]));

  Widget buildCountry() => Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: countryController,
          style: TextStyle(color: Color(textSecondary[theme_index])),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter your Country",
            prefixIcon: Icon(Icons.map),
          ),
          onChanged: (text) => setState(() {
            String currentText_country = text;
            this.city_country = text;
          }),
          onSaved: (text) => setState(() {
            this.city_country = text!;
          }),
        ),
        Text(currentText_country),
      ]));

  Widget buildSubmit() => ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ));
        //print(cityController.text);
        //print(countryController.text);
        addCard(cityController.text, countryController.text);
        //getData(cityController.text, countryController.text);
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Submit'),
        Hero(
          tag: 'NewCityFormTag',
          child: Icon(Icons.add),
        ),
      ]));
}
