import 'package:flutter/material.dart';

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pilih Fitur"),
          backgroundColor: Colors.grey[900],
        ),
        body: Container(
          child: ListView(children: <Widget>[
            Divider(
              height: 12.0,
            ),
            ListTile(
              title: Text('Converter Satuan'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  Navigator.pushNamed(context, '/Converter');
                },
              ),
            ),
            Divider(
              height: 12.0,
            ),
            ListTile(
              title: Text('Luas dan Volume'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  Navigator.pushNamed(context, '/LuasVolume');
                },
              ),
            )
          ]),
        ));
  }
}
