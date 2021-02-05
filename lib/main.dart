import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:rental_mobil/login.dart';
import 'package:rental_mobil/screens/available/available_car_screen.dart';
import 'package:rental_mobil/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:rental_mobil/libservices/authentication.dart';
import 'package:rental_mobil/screens/available/available_car_screen.dart';



// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: SplashScreenPage(),
//     );
//   }
// }

Future<void> main() async { 
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(); 
  runApp(MyApp()); 
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges),
      ],
      child: MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Color(0xff2196f3),
            accentColor: Colors.blue[500]),
        home: SplashScreenPage(),
      ),
    );
  }
}
class AuthenticationWrapper extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    final firebaseUser = context.watch<User>(); 
  
    if (firebaseUser != null) { 
      //If the user is successfully Logged-In. 
      return AvailableCarScreen(); 
    } else { 
      //If the user is not Logged-In. 
      return LoginPage(); 
       
    } 
  } 
}