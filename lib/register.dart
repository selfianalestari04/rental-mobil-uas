import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_mobil/constant.dart';
import 'package:rental_mobil/login.dart';
import 'package:provider/provider.dart';
import 'package:rental_mobil/libservices/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //To Toggle Password Text Visibility. 
  bool _obscureText = true;  
  String  _namalengkap, _username, _nohp, _email, _password; 
    
  //For the loading state. 
  bool _isSubmitting;  
  
  final _formKey = GlobalKey<FormState>(); 
  final _scaffoldKey = GlobalKey<ScaffoldState>(); 
  
  FirebaseAuth auth = FirebaseAuth.instance;
  final DateTime timestamp = DateTime.now(); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
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
                    _iconRegister(),
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

  Widget _iconRegister() {
    return Image.asset(
      "assets/images/maserati.png",
      width: 120.0,
      height: 120.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5.0),
        ),
        Text(
          "REGISTRASI",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0.0),
        ),
        TextFormField(
          onSaved: (val) => _namalengkap = val,
          decoration: InputDecoration(
                  hintText: "Nama Lengkap",
                  icon: Icon(Icons.person_add, color: Colors.black, size: 35),
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
                        msg: "Nama Lengkap Tidak Boleh Kosong!!!");
                  }
                  return null;
                },
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),
     
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          onSaved: (val) => _username = val,
          decoration: new InputDecoration(
                  hintText: "Username",
                  icon: Icon(Icons.person, color: Colors.black, size: 35),
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
                        msg: "Username Tidak Boleh Kosong!!!");
                  }
                  return null;
                },
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),

        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          onSaved: (val) => _username = val,
          decoration: new InputDecoration(
                  hintText: "No Hp",
                  icon: Icon(Icons.phone, color: Colors.black, size: 35),
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
                        msg: "No Hp Tidak Boleh Kosong!!!");
                  }
                  return null;
                },
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),

        Padding(
          padding: EdgeInsets.only(top: 12.0),
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
          padding: EdgeInsets.only(top: 12.0),
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
                  'Register',
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
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ],
    );
  }

  _submit() { 
    final _form = _formKey.currentState; 
    if (_form.validate()) { 
      _form.save(); 
      _registerUser(); 
    } else { 
      print("Form is Invalid"); 
    } 
  } 
    
  _registerUser() async { 
    setState(() { 
      _isSubmitting = true; 
    }); 
    
    final logMessage = await context 
        .read<AuthenticationService>() 
        .signUp(email: _email, password: _password); 
  
    logMessage == "Signed Up"
        ? _showSuccessSnack(logMessage) 
        : _showErrorSnack(logMessage); 
  
    print(logMessage); 
  
    if (logMessage == "Signed Up") { 
      createUserInFirestore(); 
      return Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return LoginPage();
          }
        )
      ); 
    } else { 
      setState(() { 
        _isSubmitting = false; 
      }); 
    } 
  } 
  
  _showSuccessSnack(String message) { 
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
  } 
  
  createUserInFirestore() async { 
    

    context.read<AuthenticationService>().addUserToDB( 
        uid: auth.currentUser.uid,
        namalengkap: _namalengkap, 
        username: _username,
        nohp: _nohp, 
        email: auth.currentUser.email, 
        timestamp: timestamp); 
  }
}