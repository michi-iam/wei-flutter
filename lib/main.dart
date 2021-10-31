import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import './components/meinbutton.dart';
import './covid/coviddata.dart';




Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  bool _childButtonClicked = false;



  void _childClick() {
    setState(() {
      _childButtonClicked = !_childButtonClicked;
    });
    print("Hier parent");

  }


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          title: const Text("FluttyDiHutti"),
        ),
        body:  Container(
          color: Color(0xffE0F2F1),
          constraints: BoxConstraints(minHeight: 100),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                height: 200.0,
                width: 200.0,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        image:  AssetImage('elch.jpg'),
                        fit: BoxFit.fill
                    ),
                    shape: BoxShape.circle
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child:Text('Herzlich willkommen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Aleo',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.blue,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: MeinButton(_childClick),

              ),
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: _childButtonClicked ? ShowCovidData() : Text(""),
              )
            ],
          ),
        ),
      ),
    );
  }
}


