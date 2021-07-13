import 'package:flutter/material.dart';
import 'package:sushi_rail/screens/mainScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sushi Rail',
      initialRoute: '/homeScreen',
      routes: {
        '/homeScreen' : (context) => HomeScreen(),
      }
    );
  }
}

