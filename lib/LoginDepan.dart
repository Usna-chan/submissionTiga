import 'package:flutter/material.dart';

class LoginDepan extends StatefulWidget {
  @override
  _LoginDepanState createState() => _LoginDepanState();
}

class _LoginDepanState extends State<LoginDepan> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _token = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Form(
            key: _token,
            child: Builder(
                builder: (context) => Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 250, 10, 0),
                        child: ListView(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Usna',
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 40),
                                )),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Isi Username terlebih dahulu.';
                                  }
                                  return null;
                                },
                                controller: usernameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Isi Password terlebih dahulu.';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
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
                                  child: Text('Login'),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20),
                                  ),
                                  onPressed: () {
                                    if (_token.currentState.validate()) {
                                      if (usernameController.text ==
                                              'udacodingid' &&
                                          passwordController.text ==
                                              'udacodingJaya2021') {
                                        
                                        Navigator.pushNamed(context, '/HalamanUtama');
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                                content:
                                                    Text('Berhasil Login')));
                                      } else if (usernameController.text ==
                                              'udacodingid' ||
                                          passwordController.text ==
                                              'udacodingJaya2021') {
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text(
                                                'Username atau Password anda salah')));
                                      } else {
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text(
                                                'Username atau Password anda salah')));
                                      }
                                    }
                                  },
                                )),
                          ],
                        ))))));
  }
}
