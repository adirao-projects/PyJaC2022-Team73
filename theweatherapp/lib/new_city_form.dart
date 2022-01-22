import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';

//import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class NewCityForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Center(
          child: Form(
            child: Column(
              children: [
                MaterialTextInputCity(),
                MaterialTextInputState(),
                MaterialTextInput(),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(children: [
                    Text('Submit'),
                    Hero(
                      tag: 'NewCityFormTag',
                      child: Icon(Icons.add),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Enter your City",
          prefixIcon: Icon(Icons.location_city),
        ),
        onChanged: (text) => setState(() {
          String currentText = text;
        }),
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


/*
TextFormField (
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent,),
      borderRadius: BorderRadius.circular(7.0),

    ),
    prefixIcon: prefix_icon,

  ),

);
*/