import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  var fromTextController =
      TextEditingController.fromValue(new TextEditingValue(text: '0.0'));
  var toTextController =
      TextEditingController.fromValue(new TextEditingValue(text: '0.0'));
  String fromUnits = "Km";
  String toUnits = "M";
  String result;

  @override
  _onFromChanged(String value) {}

  _onToChanged(String value) {
    setState(() {
      toUnits = value;
    });
  }

  _converter(String units) {
    if (units == 'Km') {
      return 1000;
    } else if (units == 'Hm') {
      return 100;
    } else if (units == 'Dam') {
      return 10;
    } else if (units == 'M') {
      return 1;
    } else if (units == 'Dm') {
      return 0.1;
    } else if (units == 'Cm') {
      return 0.01;
    } else if (units == 'Mm') {
      return 0.001;
    }
  }
  _changeTextFromController(){
    String ConverterValue = (_converter(toUnits) /
                            _converter(fromUnits) *
                            double.parse(fromTextController.text))
                        .toString();
                    fromTextController.value = new TextEditingController.fromValue(
                            new TextEditingValue(text: ConverterValue))
                        .value;
  }
  _changeTextToController(){
    String ConverterValue = (_converter(fromUnits) /
                  _converter(toUnits) *
                  double.parse(fromTextController.text))
              .toString();
          toTextController.value = new TextEditingController.fromValue(
                  new TextEditingValue(text: ConverterValue))
              .value;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Units Converter"),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,230,10,0),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(20),
                
                  title: TextField(
                    controller: fromTextController,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onChanged: (text) {
                      _changeTextToController();
                    },
                    
                  ),
                  trailing: _buildDropDownButton(fromUnits),
                ),
                IconButton(
                  
                  icon: Icon(Icons.sync),
                  onPressed: (){
                    String newValueFrom,newValueTo;
                    newValueFrom = toUnits;
                    newValueTo = fromUnits;
                    setState(() {
                      fromUnits = newValueFrom;
                      toUnits = newValueTo;
                    });
                    _changeTextFromController();
                    _changeTextToController();
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: TextField(
                    controller: toTextController,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onChanged: (text) {
                      _changeTextFromController();
                    },
                  ),
                  trailing: _buildDropDownButton(toUnits),
                ),
              ],
            ),
        ),
      ),
    );
  }

  Widget _buildDropDownButton(String length) {
    return DropdownButton(
      value: length,
      items: <String>['Km', 'Hm', 'Dam', 'M', 'Dm', 'Cm', 'Mm']
          .map((String value) => DropdownMenuItem(
                value: value,
                child: Row(
                  children: <Widget>[
                    Text(value),
                  ],
                ),
              ))
          .toList(),
      onChanged: (String value) {
        if (length == fromUnits) {
          setState(() {
            fromUnits = value;
          });
          _changeTextFromController();
        } else {
          setState(() {
            toUnits = value;
          });
          _changeTextToController();
        }
      },
    );
  }
}
