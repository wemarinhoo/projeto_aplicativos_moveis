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
    var url = Uri.https("blockchain.info", "ticker");
    
    // Implementar o método de requisição
    http.Response response = await http.get(url);
    
    // Implementar converter o retorno para JSON
    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      // Implementar a lógica para atualizar o preço do Bitcoin em Reais
      // O preço do Bitcoin em Reais está na chave "BRL" e o valor do preço está na chave "buy"
      if (retorno.containsKey("BRL")) {
        double precoBitcoin = retorno["BRL"]["buy"];
        _preco = "R\$ ${precoBitcoin.toStringAsFixed(2)}";
      } else {
        _preco = "Erro ao obter preço";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Bitcoin"),
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
                child: Text(
                  "R\$ $_preco",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _recuperarPreco,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  "Atualizar",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}