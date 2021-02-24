import 'package:flutter/material.dart';

class LuasVolume extends StatefulWidget {
  @override
  _LuasVolumeState createState() => _LuasVolumeState();
}

class _LuasVolumeState extends State<LuasVolume> {
  TextEditingController lebarController = TextEditingController();
  TextEditingController panjangController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  String result;
  final _token = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Units Converter"),
          backgroundColor: Colors.grey[900],
        ),
        body: Form(
            key: _token,
            child: Container(
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Luas & Volume',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30),
                            )),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Isi Panjang terlebih dahulu.';
                              }
                              return null;
                            },
                            controller: panjangController,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Panjang',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Isi Lebar terlebih dahulu.';
                              }
                              return null;
                            },
                            controller: lebarController,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Lebar',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: tinggiController,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tinggi',
                            ),
                          ),
                        ),
                        Container(
                            height: 100.0,
                            alignment: FractionalOffset.center,
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                              textColor: Colors.white,
                              color: Colors.grey[900],
                              child: Text('Calculate'),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20),
                              ),
                              onPressed: () {
                                if (_token.currentState.validate()) {
                                  setState(() {
                                    print(tinggiController.text);
                                    if (tinggiController.text == '') {
                                      result = 'Luasnya adalah ' +
                                          (double.parse(lebarController.text) *
                                                  double.parse(
                                                      panjangController.text))
                                              .toString();
                                    } else {
                                      result = 'Volumenya adalah ' +
                                          (double.parse(lebarController.text) *
                                                  double.parse(
                                                      panjangController.text) *
                                                  double.parse(
                                                      tinggiController.text))
                                              .toString();
                                    }
                                  });
                                }
                              },
                            )),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: new BorderRadius.circular(5),
                          ),
                          child: result != null
                              ? Text(
                                  result,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "Hasil akan muncul disini",
                                  textAlign: TextAlign.center,
                                ),
                        )
                      ],
                    )))));
  }
}
