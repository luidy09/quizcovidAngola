import 'package:flutter/material.dart';
import 'package:quiz_covid/homepage.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFF4E2771)),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[],
            ),
            body: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(children: <Widget>[
                          Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: new AssetImage("assets/logo_lilas.png"),
                              fit: BoxFit.contain,
                            )),
                          ),
                          SizedBox(height: 20.0),
                          Card(
                            color: Color(0xFF4E2771),
                            margin: EdgeInsets.only(left: 15.0, right: 15.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0)),
                            child: SingleChildScrollView(
                              child: Container(
                                  width: 350,
                                  height: 500,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Desenvolvedor: Luidy da Silva",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                          "Suporte: Pedro Pombal",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "UI Designer: Jacob Pessela",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Versão: Demo",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Divider(
                                            height: 20.0,
                                            color: Colors.black45),
                                        RichText(
                                          text: TextSpan(
                                              text:
                                                  'QUIZ COVID-19 Angola, é uma aplicação de caracter educacional que visa ensinar de uma forma diferente, baseando-se em afirmações sejam elas verdadeiras e falsas referente a doença que tem assolado o mundo todo.',
                                              style: TextStyle(fontSize: 20.0)),
                                        ),
                                        Divider(
                                            height: 50.0,
                                            color: Colors.black45),
                                        RichText(
                                          text: TextSpan(
                                              text:
                                                  '- Podes partilhar os seus pontos com amigos, clicando numa das caixas na pagina de pontuação e ver quem é o melhor. Para iniciar timer basta clicar no circulo dos segundos.',
                                              style: TextStyle(fontSize: 18.0)),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          )
                        ])),
                  ])),
            )));
  }
}
