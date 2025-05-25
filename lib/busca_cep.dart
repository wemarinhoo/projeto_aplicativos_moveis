import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BuscaCep extends StatefulWidget {
  const BuscaCep({super.key});

  @override
  BuscaCepState createState() => BuscaCepState();
}

class BuscaCepState extends State<BuscaCep> {

  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "Resultado";
  
  _recuperarCep() async {

    String cepDigitado = _controllerCep.text;

    if (cepDigitado.isEmpty || cepDigitado.length < 8 || cepDigitado.length > 8) {
      setState(() {
        _resultado = "CEP inválido";
      });
      return;
    }

    // https://viacep.com.br/ws/55024740/json/
    var url = Uri.https("viacep.com.br", "/ws/$cepDigitado/json/");
    http.Response response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];
    String regiao = retorno["regiao"];
    String ddd = retorno["ddd"];

    setState(() {
      _resultado = '''
        Rua: $logradouro $complemento
        Bairro: $bairro
        Cidade: $localidade
        Estado: $uf
        Região: $regiao
        DDD: $ddd
      ''';
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Busca de CEP"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o CEP ex.: 55024-740"
              ),
              style: TextStyle(
                fontSize: 20
              ),
              controller: _controllerCep,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: ElevatedButton(
                onPressed: _recuperarCep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: Text("Buscar CEP"),
              ),
            ),
            Text( _resultado,
              style: TextStyle(
                fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}
