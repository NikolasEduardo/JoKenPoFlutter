import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

var apertado = false;

class _JogoState extends State<Jogo> {
  var _vitoria = "Faça sua jogada";
  var escolhas = ['👊', '✋', '✌'];
  var _imagembot = "imagens/padrao.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text("                 JoKenPô Com Imagens")),
        body: Center(
          child: Column(
            children: [
              //___________________________texto - escolha do app
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text("Escolha do Bot:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              //___________________________imagem
              Container(
                child: Image.asset(_imagembot),
              ),

              //___________________________texto - resultado
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text("$_vitoria",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),

              //___________________________linha 3 emojis
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        var resultadofinal = aleatoriezarImagem(escolhas, "👊");
                        setState(() {
                          _imagembot = resultadofinal[0];
                          _vitoria = resultadofinal[1];
                        });
                      },
                      child: Image.asset(
                        "imagens/pedra.png",
                        width: 120,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        var resultadofinal = aleatoriezarImagem(escolhas, "✋");
                        setState(() {
                          _imagembot = resultadofinal[0];
                          _vitoria = resultadofinal[1];
                        });
                      },
                      child: Image.asset(
                        "imagens/papel.png",
                        width: 120,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        var resultadofinal = aleatoriezarImagem(escolhas, "✌");
                        setState(() {
                          _imagembot = resultadofinal[0];
                          _vitoria = resultadofinal[1];
                        });
                      },
                      child: Image.asset(
                        "imagens/tesoura.png",
                        width: 120,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

//FUNÇÃO PARA AS IMAGENS
List aleatoriezarImagem(escolhas, suaescolha) {
  if (apertado) {
    apertado = false;
    return ["imagens/padrao.png", "Faça sua jogada"];
  } else {
    apertado = true;
    var botdecisao;
    var aleatorio = Random();
    var index = aleatorio.nextInt(escolhas.length);
    var escolhafinal = escolhas[index];
    var resultado;
    print(escolhafinal);
    switch (escolhafinal) {
      case "👊":
        botdecisao = "imagens/pedra.png";
        break;
      case "✋":
        botdecisao = "imagens/papel.png";
        break;
      case "✌":
        botdecisao = "imagens/tesoura.png";
        break;
    }
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
    return ["$botdecisao", "$resultado"];
  }
}
