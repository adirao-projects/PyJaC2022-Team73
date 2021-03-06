import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:theweatherapp/theme_config.dart';

class CityCard extends StatefulWidget {
  final String cityName;
  final String cityLocation;
  final int cityID;
  const CityCard(
      {Key? key,
      required this.cityName,
      required this.cityLocation,
      required this.cityID})
      : super(key: key);

  @override
  State<CityCard> createState() => _CityCard();
}

class _CityCard extends State<CityCard> {
  double temp = 0.00;
  String tempUnits = "C";
  double windSpd = 0.00;
  double rainPercent = 0.00;
  String cityInfo = '';

  _CityCard();

  void updateWeather(int cityID) {
    double newTemp = 0.00; //API CALL
    double newWindSpd = 0.00; //API CALL
    double newRainPercent = 0.00; //API CALL
    String newCityInfo = '';
    setState(() {
      temp = newTemp;
      rainPercent = newRainPercent;
      windSpd = newWindSpd;
      cityInfo = newCityInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    //updateWeather(widget.cityID);
    return InkWell(
      child: Card(
        //color: Colors.blueGrey[400],
        elevation: 20.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(widget.cityName),
                subtitle: Text(widget.cityLocation),
                trailing: IconButton(
                    onPressed: () => {widget.removeFunc(widget.index)},
                    icon: Icon(Icons.delete, color: Colors.red)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.thermostat, color: Colors.red),
                        Text("Temp: $temp°$tempUnits")
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.umbrella, color: Colors.blue),
                        Text("Rain: $rainPercent%"),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.air, color: Colors.white),
                        Text("Wind: $windSpd m/s"),
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityTile {
  String cityName;
  String cityLocation;
  int cityID;
  double temp;
  String tempUnits = "C";
  double windSpd;
  double rainPercent;
  String cityInfo;

  CityTile(this.cityName, this.cityLocation, this.cityID, this.temp,
      this.rainPercent, this.windSpd, this.cityInfo) {}

  void updateWeather(double newTemp, double newWindSpd, double newRainPercent) {
    this.temp = newTemp;
    this.rainPercent = newRainPercent;
    this.windSpd = newWindSpd;
  }

  void changeUnits() {
    if (this.tempUnits == "C") {
      this.tempUnits = "F";
      this.temp = (this.temp * 1.8) + 32;
    } else {
      this.tempUnits = "C";
      this.temp = (this.temp - 32) / 1.8;
    }
  }

  generateCard() {
    return GestureDetector(
      onTap: () => print('City Tapped!'),
      child: Card(
        color: Colors.blueGrey[700],
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(this.cityName),
                subtitle: Text(this.cityLocation),
                trailing: Icon(Icons.delete, color: Colors.red),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.thermostat, color: Colors.red),
                        Text("Temp: $temp°$tempUnits")
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.umbrella, color: Colors.blue),
                        Text("Rain: $rainPercent%"),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.air, color: Colors.white),
                        Text("Wind: $windSpd km/h"),
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
