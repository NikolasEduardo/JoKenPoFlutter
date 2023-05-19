import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

var apertado = false;

class _JogoState extends State<Jogo> {
  var _vitoria = "Faça sua jogada";
  var _escolhabot = "🤓";
  var escolhas = ['👊', '✋', '✌'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text("                             JoKenPô")),
        body: Center(
          child: Column(
            children: [
              //texto - escolha do app
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text("Escolha do Bot:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              //imagem
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "$_escolhabot",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              //texto - resultado
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text("$_vitoria",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              //linha 3 emojis
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          var resultadofinal = aleatoriezar(escolhas, "👊");
                          setState(() {
                            _escolhabot = resultadofinal[0];
                            _vitoria = resultadofinal[1];
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text("👊", style: TextStyle(fontSize: 50)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          var resultadofinal = aleatoriezar(escolhas, "✋");
                          setState(() {
                            _escolhabot = resultadofinal[0];
                            _vitoria = resultadofinal[1];
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text("✋", style: TextStyle(fontSize: 50)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          var resultadofinal = aleatoriezar(escolhas, "✌");
                          setState(() {
                            _escolhabot = resultadofinal[0];
                            _vitoria = resultadofinal[1];
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text("✌", style: TextStyle(fontSize: 50)),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

List aleatoriezar(escolhas, suaescolha) {
  if (apertado) {
    apertado = false;
    return ["🤓", "Faça sua jogada"];
  } else {
    apertado = true;
    var aleatorio = Random();
    var index = aleatorio.nextInt(escolhas.length);
    var escolhafinal = escolhas[index];
    var resultado;
    print(escolhafinal);
    if (escolhafinal == suaescolha) {
      print("Empate");
    } else if ((escolhafinal == "👊" && suaescolha == "✌") ||
        (escolhafinal == "✌" && suaescolha == "✋") ||
        (escolhafinal == "✋" && suaescolha == "👊")) {
      print("Você Perdeu, pois $escolhafinal ganha de $suaescolha");
      resultado = "Você Perdeu, pois $escolhafinal ganha de $suaescolha";
    } else if ((escolhafinal == "✋" && suaescolha == "✌") ||
        (escolhafinal == "👊" && suaescolha == "✌") ||
        (escolhafinal == "✌" && suaescolha == "👊")) {
      print("Você Ganhou, pois $suaescolha ganha de $escolhafinal");
      resultado = "Você Ganhou, pois $suaescolha ganha de $escolhafinal";
    }
    return ["$escolhafinal", "$resultado"];
  }
}