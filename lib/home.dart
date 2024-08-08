import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _imagemApp = AssetImage("assets/images/nada.jpg");
  var _mensagem = "Escolha uma das jogadas abaixo:";
  var _escolhaUser = 0;
  var _escolhaApp = 0;
  var _empate = 0;

  void _opcaoSelecionada(String escolhaDoUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura', 'lizard', 'spock'];
    var numero = Random().nextInt(5);
    var aleatorioApp = opcoes[numero];

    switch (aleatorioApp) {
      case 'pedra':
        setState(() {
          this._imagemApp = AssetImage("assets/images/pedra.jpg");
        });
        break;
      case 'papel':
        setState(() {
          this._imagemApp = AssetImage("assets/images/papel.jpg");
        });
        break;
      case 'tesoura':
        setState(() {
          this._imagemApp = AssetImage("assets/images/tesoura.jpg");
        });
        break;
      case 'lizard':
        setState(() {
          this._imagemApp = AssetImage("assets/images/lizard.png");
        });
      case 'spock':
        setState(() {
          this._imagemApp = AssetImage("assets/images/spock.png");
        });
    }

    if (escolhaDoUsuario == aleatorioApp) {
      setState(() {
        _mensagem = "Empate!";
        _empate++;
      });
    } else if ((escolhaDoUsuario == 'papel' && aleatorioApp == 'pedra') ||
        (escolhaDoUsuario == 'pedra' && aleatorioApp == 'tesoura') ||
        (escolhaDoUsuario == 'tesoura' && aleatorioApp == 'papel') ||
        (escolhaDoUsuario == 'pedra' && aleatorioApp == 'lizard') ||
        (escolhaDoUsuario == 'lizard' && aleatorioApp == 'spock') ||
        (escolhaDoUsuario == 'spock' && aleatorioApp == 'tesoura') ||
        (escolhaDoUsuario == 'tesoura' && aleatorioApp == 'lizard') ||
        (escolhaDoUsuario == 'lizard' && aleatorioApp == 'papel') ||
        (escolhaDoUsuario == 'papel' && aleatorioApp == 'spock') ||
        (escolhaDoUsuario == 'spock' && aleatorioApp == 'pedra')) {
      setState(() {
        _mensagem = "Você ganhou!";
        _escolhaUser++;
      });
    } else {
      setState(() {
        _mensagem = "Você perdeu!";
        _escolhaApp++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Jogo Jokenpô'),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                '1, 2, 3 ... Já!!!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //
            Image(
              image: _imagemApp,
              height: 250,
            ),

            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada('pedra'),
                  child: Image.asset('assets/images/pedra.jpg', height: 100),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('papel'),
                  child: Image.asset('assets/images/papel.jpg', height: 100),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('tesoura'),
                  child: Image.asset('assets/images/tesoura.jpg', height: 100),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20), // Adiciona margem superior ao Row de baixo
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada('spock'),
                    child: Image.asset('assets/images/spock.png', height: 100),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada('lizard'),
                    child: Image.asset('assets/images/lizard.png', height: 100),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Você: $_escolhaUser", style: TextStyle(fontSize: 20)),
                Text("App:  $_escolhaApp", style: TextStyle(fontSize: 20)),
                Text("Empate: $_empate",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ));
  }
}
