// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_signin/home_screen.dart';
import 'package:firebase_signin/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/screenshots/home1.jpeg'), fit: BoxFit.cover),
      ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'Map Translations Application',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
            Container(
              height: 300,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 3.1),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginPage()));
                      },
                      child: Text('Login')),
                ),
                Center(
                  child: Container(
                    width: 20,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: Text('Sign-Up')),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}