import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

/* Container(
              color: Colors.blueGrey[700],
              child: ListTile(
                title: Text("Temperature: $temp°C"),
              ),
*/