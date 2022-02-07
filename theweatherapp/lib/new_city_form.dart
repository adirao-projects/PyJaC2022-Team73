import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'main.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:theweatherapp/theme_config.dart';

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

    //List data = JSON.decode(response.body);
    return response.body;
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
        getData(cityController.text, countryController.text);
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Submit'),
        Hero(
          tag: 'NewCityFormTag',
          child: Icon(Icons.add),
        ),
      ]));
}
/*
class MaterialTextInputCity extends StatefulWidget {
  const MaterialTextInputCity({Key? key}) : super(key: key);

  @override
  _MaterialTextInputCityState createState() => _MaterialTextInputCityState();
}

class _MaterialTextInputCityState extends State<MaterialTextInputCity> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
        style: TextStyle(color: Color(textSecondary[theme_index])),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Enter your City",
          prefixIcon: Icon(Icons.location_city),
        ),
        onChanged: (text) => setState(() {
          String currentText = text;
        }),
        onEditingComplete: (text) => setState(() => city_name = text),
        
      ),
      Text(currentText),
    ]));
  }
}

class MaterialTextInputState extends StatefulWidget {
  const MaterialTextInputState({Key? key}) : super(key: key);

  @override
  _MaterialTextInputStateState createState() => _MaterialTextInputStateState();
}

class _MaterialTextInputStateState extends State<MaterialTextInputState> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
        style: TextStyle(color: Color(textSecondary[theme_index])),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Enter your State",
          prefixIcon: Icon(Icons.map),
        ),
        onChanged: (text) => setState(() {
          String currentText = text;
        }),
      ),
      Text(currentText),
    ]));
  }
}

class MaterialTextInput extends StatefulWidget {
  const MaterialTextInput({Key? key}) : super(key: key);

  @override
  _MaterialTextInputState createState() => _MaterialTextInputState();
}

class _MaterialTextInputState extends State<MaterialTextInput> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
        style: TextStyle(color: Color(textSecondary[theme_index])),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Enter your Text",
        ),
        onChanged: (text) => setState(() {
          String currentText = text;
        }),
      ),
      Text(currentText),
    ]));
  }
}
*/