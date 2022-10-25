import 'package:flutter/material.dart';

class Resposta extends StatelessWidget{

  final String resposta;
  final void Function() quandoSelecionado;

  Resposta(this.resposta, this.quandoSelecionado);
  @override
  Widget build(BuildContext context){
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(backgroundColor: Colors.pink);
    return Center(
      child: SizedBox(
        width: 150,
        child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                onPressed: quandoSelecionado,
                child: Text(resposta),
              ),
      ),
    );
  }
}