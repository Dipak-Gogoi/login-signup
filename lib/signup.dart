import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final  _pass = TextEditingController();
  final _confirmPass = TextEditingController();

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Stack(children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 50.0, 0, 0),
                      child: Text(
                        'Hi',
                        style: TextStyle(
                          color: Colors.blueGrey[300],
                          fontSize: 70.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 105.0, 0, 0),
                      child: Text(
                        'People',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 70.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(230.0, 105.0, 0, 0),
                      child: Text(
                        '.',
                        style: TextStyle(
                          fontSize: 70.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ])),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: formSetup(context),
              )
            ],
          ),
        ));
  }

  Widget formSetup(BuildContext context) {
    return new Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            new TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                if (val.length == 0)
                  return "Please enter email";
                else if (!val.contains("@"))
                  return "Please enter valid email";
                else
                  return null;
              },
              onSaved: (val) => _email = val,
            ),
            new TextFormField(
              controller: _pass,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontFamily: '',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              obscureText: true,
              validator: (val) {
                if (val.length == 0)
                  return "Please enter password";
                else if (val.length <= 5)
                  return "Your password should be more then 6 char long";
                else
                  return null;
              },
              onSaved: (val) => _password = val,
            ),
            new TextFormField(
              controller: _confirmPass,
              decoration: InputDecoration(
                labelText: 'Retype Password',
                labelStyle: TextStyle(
                  fontFamily: '',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              obscureText: true,
              validator: (val) {
                if (val.length == 0)
                  return "Please enter password";
                // else if (val.length <= 5)
                //   return "Your password should be more then 6 char long";
                else if (val != _pass.text)
                  return "Password didn't match";
                else
                  return null;
              },
              onSaved: (val) => _password = val,
            ),
            SizedBox(height: 40.0),
            Container(
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.blue[600],
                color: Colors.blue[600],
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _scaffoldKey.currentState.showSnackBar(new SnackBar(
                        content: new Text(
                            "Your email: $_email and Password: $_password"),
                      ));
                    }
                  },
                  child: Center(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 40.0,
              // color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/facebook2.png',
                        height: 25.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Center(
                      child: Text(
                        'Log in with facebook',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Already have aoocunt ?'),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
