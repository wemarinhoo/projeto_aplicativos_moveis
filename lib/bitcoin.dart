import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bitcoin extends StatefulWidget {
  const Bitcoin({super.key});

  @override
  BitcoinState createState() => BitcoinState();
}

class BitcoinState extends State<Bitcoin> {

  String _preco = "0";

  void _recuperarPreco() async {

    // "https://blockchain.info/ticker";
    var url = Uri.https("blockchain.info", "ticker");
    // Implementar o método de requisição
    http.Response response = await http.get(url);
    // Implementar converter o retorno para JSON
    Map<String, dynamic> retorno = json.decode( response.body );

    setState(() {
      // Implementar a lógica para atualizar o preço
      // do Bitcoin em Reais
      // O preço do Bitcoin em Reais está na chave "BRL"
      // e o valor do preço está na chave "buy"
      _preco = "Implementar o preço do Bitcoin em Reais";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Título tela"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/bitcoin.png", height: 70),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text("Valor do Bitcoin",
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _recuperarPreco,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: Text("Atualizar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
