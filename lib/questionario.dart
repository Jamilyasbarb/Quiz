import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {

  final List <Map<String,Object>> perguntas;
  
  final int perguntaSelecionada;
  final void Function(int, String) responder;

 Questionario({super.key, 
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder
  });


  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }
@override
  Widget build(BuildContext context){
    List <Map<String, Object>> respostas = temPerguntaSelecionada ? perguntas[perguntaSelecionada].cast()['resposta'] : [];
    // print(' ---iii-- ${respostas['opcao']}');
    return Column(
      children: <Widget>[
          Questao(perguntas[perguntaSelecionada]['pergunta'].toString()),
          ...respostas.map((resp) => Resposta(resp['opcao'] as String, () => responder(int.parse(resp['nota'].toString()), resp['opcao'] as String))),
        ],

    );
  }
}