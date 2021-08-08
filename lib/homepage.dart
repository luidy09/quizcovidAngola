import 'package:flutter/material.dart';
import 'package:quiz_covid/aboutpage.dart';
import 'package:quiz_covid/quizpage.dart';

import 'quizpagetiming.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var ti, sti;

  @override
  void initState() {
    super.initState();
  }

  void _showDialogTimer() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Escolher Categoria",
                  style: TextStyle(
                      color: Color(0xFF4E2771),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          content: Text(""),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  setState(() {
                    ti = 2;
                  });
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.timer,
                  size: 30,
                  color: Color(0xFF4E2771),
                )),
            new FlatButton(
                onPressed: () {
                  setState(() {
                    ti = 1;
                  });
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.timer_off,
                  size: 30,
                  color: Color(0xFF4E2771),
                )),
          ],
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child:
                      Icon(Icons.favorite, size: 50, color: Color(0xFF4E2771)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 10.0),
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundColor: Color(0xFFCA464F),
                    child: Text(
                      '5',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: new AssetImage("assets/logo_lilas.png"),
                          fit: BoxFit.contain,
                        )),
                      ),
                      SizedBox(height: 100.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutPage()));
                        },
                        child: Container(
                          height: 60.0,
                          width: 350.0,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, top: 15.5),
                            child: Text(
                              "Sobre",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFF4E2771),
                              borderRadius:
                                  new BorderRadiusDirectional.circular(8.0)),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () {
                          _showDialogTimer();
                        },
                        child: Container(
                          height: 60.0,
                          width: 350.0,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, top: 15.5),
                            child: Text(
                              "Categoria",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFF4E2771),
                              borderRadius:
                                  new BorderRadiusDirectional.circular(8.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (ti == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizPage()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizPageTime()));
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:50.0),
                    child: Container(
                      height: 60.0,
                      width: 150.0,
                      margin: EdgeInsets.only(left: 200.0, top: 150.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 70.0, top: 15.5),
                        child: Text(
                          "Jogar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.topLeft,
                              image: new AssetImage("assets/play_buttom.png"),
                              fit: BoxFit.contain),
                          color: Color(0xFF4E2771),
                          borderRadius:
                              new BorderRadiusDirectional.circular(8.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
