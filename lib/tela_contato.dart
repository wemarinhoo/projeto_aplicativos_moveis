import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  const TelaContato({super.key});

  @override
  TelaContatoState createState() => TelaContatoState();
}

class TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contato"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 32), // Margem inferior no primeiro elemento
                child: Row(
                  children: <Widget>[
                    Icon(Icons.email, color: Colors.green, size: 60),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Contato",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(bottom: 16), // Margem inferior entre os textos
                child: Text("email: atendimento@novaroma.edu.br",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16), // Margem inferior entre os textos
                child: Text("Telefone: (11) xxxx-xxxx",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  ),
                ),
              ),
              Text("Celular: (81) 9xxxx-xxxx",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}