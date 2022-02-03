import 'package:flutter/material.dart';

class CardTexto extends StatefulWidget {
  const CardTexto({Key? key}) : super(key: key);

  @override
  _CardTextoState createState() => _CardTextoState();
}

class _CardTextoState extends State<CardTexto> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 14,
      borderRadius: BorderRadius.circular(24),
      shadowColor: Colors.black,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Visão Geral",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 100,
                      width: 370,
                      child: Text(
                        "Construção de tela na plataforma WEB com flutter contendo gráfico em linha que exiba informações "
                        "por tempo dos registros vindos do Endpoint. Junto a uma tabela listando os registros feitos por usuário"
                        "de ocorrência e seus dias executados pelo EndPoint.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
