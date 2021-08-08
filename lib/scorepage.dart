import 'package:flutter/material.dart';
import 'package:quiz_covid/homepage.dart';
import 'package:share/share.dart';

class ScorePage extends StatefulWidget {
  int certas, erradas, totalP, nulas, pontos;

  ScorePage({
    this.certas,
    this.erradas,
    this.totalP,
    this.nulas,
    this.pontos,
  });

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int tP = 0;
  int tC = 0, tE = 0, tN = 0, tV = 0;
  //double tc1 = 0, te1 = 0, tn1 = 0;

  void initState() {
    super.initState();

    if (widget.pontos.toString() == 'null' &&
        widget.totalP.toString() == 'null') {
      widget.pontos = 0;
    } else {
      int total = widget.pontos * widget.totalP;
      tP = total;
    }

    if (widget.certas.toString() == 'null') {
      widget.certas = 0;
    } else {
      int pCertas = widget.certas;
      tC = pCertas;
    }

    if (widget.erradas.toString() == 'null') {
      widget.erradas = 0;
    } else {
      int pErradas = widget.erradas;
      tE = pErradas;
    }

    if (widget.nulas.toString() == 'null') {
      widget.nulas = 0;
    } else {
      int pNulas = widget.nulas;
      tN = pNulas;
    }

/*    if (widget.vida.toString()=='null') {
      widget.vida=0;
      
    } else {
      int pVida = widget.vida;
      tV = pVida;
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
       // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Pontuação"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage())),
          ),
          elevation: 0.0,
          backgroundColor: Color(0xFF4E2771),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0xFF4E2771),
              child: GestureDetector(
                onTap: () {
                  final RenderBox box = context.findRenderObject();
                  Share.share(
                      "Quiz Covid-19 Angola. Você obteu $tP pontos, acertando $tC, errando $tE, e deixando $tN nulas.",
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '$tP',
                          style: TextStyle(
                              fontSize: 100.0, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'pts', style: TextStyle(fontSize: 28.0)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10.0),
                          height: 200.0,
                          width: 30.0,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Column(children: <Widget>[
                                Text("Respostas Certas",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 10.0),
                                Text(
                                  "$tC",
                                  style: TextStyle(
                                      fontSize: 100.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ])),
                          decoration: BoxDecoration(
                              color: Color(0xFF66BFAC),
                              borderRadius:
                                  new BorderRadiusDirectional.circular(8.0)),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        height: 200.0,
                        width: 30.0,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Column(children: <Widget>[
                              Text("Respostas Erradas",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 10.0),
                              Text(
                                "$tE",
                                style: TextStyle(
                                    fontSize: 100.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ])),
                        decoration: BoxDecoration(
                            color: Color(0xFFBE1823),
                            borderRadius:
                                new BorderRadiusDirectional.circular(8.0)),
                      )),
                    ]),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0, left: 10.0),
                        height: 200.0,
                        width: 500.0,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Column(children: <Widget>[
                              Text("Respostas Nulas",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(height: 10.0),
                              Text(
                                "$tN",
                                style: TextStyle(
                                    fontSize: 100.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ])),
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius:
                                new BorderRadiusDirectional.circular(8.0)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
