import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_mobil/libservices/authentication.dart';
import 'package:rental_mobil/register.dart';
import 'package:rental_mobil/screens/available/available_car_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/painting/gradient.dart';


class LoginPageUI extends StatefulWidget {
  @override
  _LoginPageUIState createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {
    //To Toggle Password Text Visibility. 
  bool _obscureText = true;  
  String  _username, _email, _password; 
    
  //For the loading state. 
  bool _isSubmitting;  
  
  final _formKey = GlobalKey<FormState>(); 
  final _scaffoldKey = GlobalKey<ScaffoldState>(); 
  
  FirebaseAuth auth = FirebaseAuth.instance; 
  final DateTime timestamp = DateTime.now(); 
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.green[800],
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Form( 
              key: _formKey, 
                child: Column(
                  children: <Widget>[
                    _titleDescription(),
                    _iconLogin(),
                    _textField(),
                    _buildTombol(context),
                    _buildButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _titleDescription() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      Text(
        "LOGIN",
        style: TextStyle(
          color: Colors.white,
          fontSize: 45.0,
          fontWeight: FontWeight.bold
        ),
      ),
    ],
  );
}

Widget _iconLogin() {
  return Image.asset(
    "assets/images/maserati.png",
    width: 150.0,
    height: 150.0,
  );
}



Widget _textField() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 30.0),
      ),
      TextFormField(
        onSaved: (val) => _email = val,
         decoration: new InputDecoration(
                  hintText: "Email",
                  icon: Icon(Icons.mail, color: Colors.black, size: 35),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 1.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Email Tidak Boleh Kosong!!!");
                  }
                  return null;
                },
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),
        
        Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        TextFormField(
          onSaved: (val) => _password = val,
         textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(Icons.lock, color: Colors.black, size: 35),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87, width: 1.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Password Tidak Boleh Kosong!!!");
                  }
                  return null;
                },
                  style: TextStyle(color: Colors.white),
                autofocus: false,
      ),
    ],
  );
}


  Widget _buildTombol(BuildContext context) {
    return Column(children: <Widget>[
          Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
          RaisedButton(
            onPressed: _submit,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Color(0xFF13E3D2), Color(0xFF5D74E2)],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(80.0),
                ),
              ),
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 100.0,
                  minHeight: 36.0,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          )
        ],
      );
  }

Widget _buildButton(BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      Text(
        'or',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
      FlatButton(
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Register()));
        },
      ),
    ],
  );
}

_submit() { 
    final _form = _formKey.currentState; 
    if (_form.validate()) { 
      _form.save(); 
      //print("Email $_email, Password $_password"); 
      _LoginUser(); 
    } else { 
      Fluttertoast.showToast(
                        msg: "User dan Password Tidak Terdaftar!!!");
    } 
  } 
  
  _LoginUser() async { 
    setState(() { 
      _isSubmitting = true; 
    }); 

    final logMessage = await context
        .read<AuthenticationService>()
        .signIn(email: _email, password: _password); 
  
    logMessage == "Signed In"
        ? _showSuccessSnack(logMessage) 
        : _showErrorSnack(logMessage); 
  
    //print("I am logMessage $logMessage"); 
  
    if (logMessage == "Signed In") { 
      return Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return AvailableCarScreen();
          }
        )
      ); 
    } else { 
      setState(() { 
        _isSubmitting = true; 
      }); 
    } 
  } 
  
  _showSuccessSnack(String message) async { 
    final snackbar = SnackBar( 
      backgroundColor: Colors.black, 
      content: Text( 
        "$message", 
        style: TextStyle(color: Colors.green), 
      ), 
    ); 
    _scaffoldKey.currentState.showSnackBar(snackbar); 
    _formKey.currentState.reset(); 
  } 
  
  _showErrorSnack(String message) { 
    final snackbar = SnackBar( 
      backgroundColor: Colors.black, 
      content: Text( 
        "$message", 
        style: TextStyle(color: Colors.red), 
      ), 
    ); 
    _scaffoldKey.currentState.showSnackBar(snackbar);                                       
    setState(() { 
      _isSubmitting = false; 
    }); 
  } 

}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        accentColor: Colors.blue,
      ),
      title: "Login Screen",
      home: LoginPageUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}
