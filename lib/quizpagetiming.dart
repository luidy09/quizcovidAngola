import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_covid/homepage.dart';
import 'package:quiz_covid/scorepage.dart';
import 'Q&A/brain.dart';
import 'Q&A/questionmodel.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizPageTime extends StatefulWidget {
  @override
  _QuizPageTimeState createState() => _QuizPageTimeState();
}

class _QuizPageTimeState extends State<QuizPageTime> {
  List<QuestionModel> questions = new List<QuestionModel>();
  Timer _timer;
  int _start = 15;

  int questiNumb = 0, acertos = 0, erros = 0, vida = 5, points = 0, nulas = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
   startTimer();
    });
    
    questions = getQuestions();
  }

 @override
void dispose() {
  _timer.cancel();
  super.dispose();
}


  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play("aplause.mp3");
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            _showDialogTempo();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void _showDialogTempo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: <Widget>[
              Icon(Icons.timer_off, color: Color(0xFFBE1823)),
              Divider(),
              Text("Upssss, Ficou Sem Tempo", style: TextStyle(fontSize: 18.0))
            ],
          ),
          content: SingleChildScrollView(child: Text("")),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScorePage(
                                certas: acertos,
                                erradas: erros,
                                totalP: questions.length,
                                pontos: points,
                                nulas: nulas,
                              )));
                },
                child: Text("Pontuação", style: TextStyle(fontSize: 18.0))),
            new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text("Sair", style: TextStyle(fontSize: 18.0))),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        );
      },
    );
  }

  void nextQuestion() {
    if (questiNumb < questions.length - 1) {
      questiNumb++;
    } else {
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: <Widget>[
              Icon(Icons.notifications_active, color: Color(0xFF4E2771)),
              Text("Upssss", style: TextStyle(fontSize: 18.0))
            ],
          ),
          content: SingleChildScrollView(child: Text("")),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScorePage(
                                certas: acertos,
                                erradas: erros,
                                totalP: questions.length,
                                pontos: points,
                                nulas: nulas,
                              )));
                },
                child: Text("Pontuação", style: TextStyle(fontSize: 18.0))),
            new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text("Sair", style: TextStyle(fontSize: 18.0))),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        );
      },
    );
  }

  double proGress() {
    if (questiNumb <= 9) {
      return (((questiNumb + 1) * 5.4) / 100);
    } else {
      return (((questiNumb) * 7.1) / 100);
    }
  }

  void _showDialogError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.highlight_off,
                color: Color(0xFFBE1823),
              ),
              Text("Resposta Errada",
                  style: TextStyle(color: Color(0xFFBE1823))),
            ],
          ),
          content: SingleChildScrollView(
              child: Text(questions[questiNumb - 1].getReAnswer())),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"))
          ],
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        );
      },
    );
  }

  void _showDialogVida() {
    if (vida == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: <Widget>[
                Icon(Icons.mood_bad, color: Colors.black45),
                Text("Ficou Sem Vida"),
              ],
            ),
            content: SingleChildScrollView(child: Text("Que Pena!!!")),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text("Sair")),
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScorePage(
                                  certas: acertos,
                                  erradas: erros,
                                  totalP: questions.length,
                                  pontos: points,
                                  nulas: nulas,
                                )));
                  },
                  child: Text("Pontuação")),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
          );
        },
      );
    }
  }

  void _showDialogRequest() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.notification_important,
                color: Color(0xFF66BFA6),
              ),
              Text("Dica", style: TextStyle(color: Color(0xFF66BFA6))),
            ],
          ),
          content: SingleChildScrollView(
              child: Text(questions[questiNumb].getReAnswer(),
                  style: TextStyle(fontSize: 18.0))),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  setState(() {
                    nextQuestion();
                  });
                  Navigator.of(context).pop();
                },
                child: Text("OK", style: TextStyle(fontSize: 15.0)))
          ],
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF4E2771),
        appBar: AppBar(
          backgroundColor: Color(0xFF4E2771),
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 30),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Icon(Icons.favorite, size: 50),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 10.0),
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundColor: Color(0xFFCA464F),
                    child: Text(
                      "$vida",
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: 350.0 /*MediaQuery.of(context).size.width-50*/,
                    child: Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Pontuação",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                          VerticalDivider(color: Colors.white),
                          Padding(
                            padding: const EdgeInsets.only(left: 160.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: '$points ',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'pts',
                                      style: TextStyle(fontSize: 20.0)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                new BorderRadiusDirectional.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 100.0, left: 20.0, right: 20.0),
                            child: Text(questions[questiNumb].getQuestion(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22.0)),
                          ),
                        ),
                      ),
                    ])),
                SizedBox(height: 10.0),
                Row(children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 2.0, top: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showDialogRequest();

                          nulas++;
                          vida--;

                          _showDialogVida();
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0, right: 10.0),
                        height: 90.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFCA464F),
                          borderRadius:
                              new BorderRadiusDirectional.circular(12.0),
                        ),
                        child:
                            Icon(Icons.help, size: 50.0, color: Colors.white),
                      ),
                    ),
                  )),
                  Divider(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 2.0, top: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          nextQuestion();
                          nulas++;

                          vida--;
                          _showDialogVida();
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, right: 20.0),
                        height: 90.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFCA464F),
                          borderRadius:
                              new BorderRadiusDirectional.circular(12.0),
                        ),
                        child: Icon(Icons.arrow_forward_ios,
                            size: 50.0, color: Colors.white),
                      ),
                    ),
                  )),
                ]),
                Divider(color: Colors.black, height: 30.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0, top: 8.0),
                        child: GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              height: 90.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF66BFA6),
                                borderRadius:
                                    new BorderRadiusDirectional.circular(12.0),
                              ),
                              child: Text("V",
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              alignment: Alignment.center,
                            ),
                            onTap: () {
                              if (questions[questiNumb]
                                      .getAnswer()
                                      .toString() ==
                                  "true") {
                                setState(() {
                                  points = points + 8;
                                  nextQuestion();
                                  _start++;
                                  playLocalAsset();
                                  acertos++;
                                });
                              } else {
                                setState(() {
                                  if (points == 0) {
                                    _showDialog();
                                  } else {
                                    points = points - 2;
                                  }
                                  _showDialogError();
                                  nextQuestion();
                                  erros++;
                                });
                              }
                            }),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0, top: 8.0),
                        child: GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(left: 10.0, right: 20.0),
                            height: 90.0,
                            width: 220.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFBE1823),
                              borderRadius:
                                  new BorderRadiusDirectional.circular(12.0),
                            ),
                            child: Text("F",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            alignment: Alignment.center,
                          ),
                          onTap: () {
                            if (questions[questiNumb].getAnswer().toString() ==
                                "false") {
                              setState(() {
                                points = points + 8;
                                nextQuestion();
                                _start++;
                                playLocalAsset();
                                acertos++;
                              });
                            } else {
                              setState(() {
                                if (points == 0) {
                                  _showDialog();
                                } else {
                                  points = points - 2;
                                }

                                _showDialogError();

                                nextQuestion();
                                erros++;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: new LinearPercentIndicator(
                        width: 300.0,
                        lineHeight: 15.0,
                        percent: proGress(),
                        progressColor: Color(0xFFCA464F),
                        backgroundColor: Colors.deepPurpleAccent[700],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Icon(Icons.flag, color: Colors.white, size: 30))
                  ],
                ),
                SizedBox(height: 15.0),
                CircleAvatar(
                  child: Text("$_start",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  backgroundColor: Color(0xFFCA464F),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
