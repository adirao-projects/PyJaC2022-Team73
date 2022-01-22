import 'package:flutter/material.dart';
import 'package:theweatherapp/card.dart';
import 'package:theweatherapp/new_city_form.dart';

int hexColor(String color) {
  color = color.replaceAll('#', '');
  switch (color.length) {
    case 3:
      color = '0xff' + color[0] * 2 + color[1] * 2 + color[2] * 2;
      break;

    case 6:
      color = '0xff' + color;
      break;
  }
  return int.parse(color);
}

int theme = hexColor('#2D5794');
int bgPrimary = hexColor('#2A2A2A');
int bgSecondary = hexColor('#1F1F1F');
int textPrimary = hexColor('#FFFFFF');
int textSecondary = hexColor('#F3F3F3');

List<Widget> cityTileList = [
  CityCard(
    cityName: "Boston",
    cityID: 100,
    cityLocation: "USA",
  ),
  CityTile("San Francisco", "USA", 10001, 37.11, 58, 1.1, "Blah")
      .generateCard(),
  CityTile("Delhi", "USA", 10001, 37.11, 58, 1.1, "Blah").generateCard(),
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
        primarySwatch: Colors.blue,
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
        backgroundColor: Colors.indigo.shade900,
        title: const Text('The Weather App'),
      ),
      body: ListView.builder(
        itemBuilder: (listViewContext, index) {
          return cityTileList[index];
        },
        itemCount: cityTileList.length,
      ),
    );
  }
}

//CityTile("Toronto", "Canada", 10001, 37.11, 58, 1.1, "Blah").generateCard(),
        /*ListView.builder(
          itemBuilder: (listViewContext, index){return Container();},
          itemCount: 5,*/