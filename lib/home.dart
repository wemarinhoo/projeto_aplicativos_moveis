import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  void navegarParaTela(BuildContext context, String nomeDaRota) {
    Navigator.pushNamed(context, nomeDaRota);
  }

  Container criarContainer(String text, Color color, IconData icon) {
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      width: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 60),
          SizedBox(height: 8),
          Text(text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Consultoria em TI"),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Consultoria em TI",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Image.asset("images/logo.png"),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => navegarParaTela(context, '/empresa'),
                    child: criarContainer("Empresa", Colors.red, Icons.business),
                  ),
                  GestureDetector(
                    onTap: () => navegarParaTela(context, '/servicos'),
                    child: criarContainer("Serviços", Colors.cyan, Icons.business_center),
                  ),
                  GestureDetector(
                    onTap: () => navegarParaTela(context, '/clientes'),
                    child: criarContainer("Clientes", Colors.pink, Icons.group),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => navegarParaTela(context, '/contato'),
                    child: criarContainer("Contato", Colors.green, Icons.email),
                  ),
                  GestureDetector(
                    onTap: () => navegarParaTela(context, '/bitcoin'),
                    child: criarContainer("BitCoin", Colors.orange, Icons.currency_bitcoin),
                  ),
                  GestureDetector(
                    onTap: () => navegarParaTela(context, '/buscacep'),
                    child: criarContainer("BuscaCep", Colors.indigo, Icons.location_on),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
