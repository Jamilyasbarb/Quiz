import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

class PerguntaApp extends StatefulWidget{
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacao = 0;
  String _resposta = '';
  List<String> listaDeRespostas = [];

   final List<Map<String, Object>> _perguntas = [
      {
        'pergunta': 'Qual seu animal favorito?',
        'resposta': [
          {'opcao': 'Cachorro', 'nota': 10},
          {'opcao': 'Panda', 'nota': 20},
          {'opcao': 'Girafa', 'nota': 5},
          {'opcao': 'Outro', 'nota': 3}
        ]
     },
      {
        'pergunta': 'Quantos anos você tem?',
        'resposta': [
          {'opcao': '18 a 22', 'nota': 5},
          {'opcao': '25 a 30', 'nota': 10}, 
          {'opcao': 'Mais', 'nota': 10},
          {'opcao': 'Menos', 'nota': 5},
        ]
      },
      {
        'pergunta': 'Você tem irmãos?',
        'resposta': [
          {'opcao': '1', 'nota': 5}, 
          {'opcao': '2', 'nota': 5}, 
          {'opcao': '3', 'nota': 5}, 
          {'opcao': '0', 'nota': 5}, 
          {'opcao': 'Mais', 'nota': 5}
        ], 
      }
    ];
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao, String resposta){
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
        // _perguntas(_perguntaSelecionada).toString();
         _pontuacao +=pontuacao;
         listaDeRespostas.add(resposta);
        print('lista$listaDeRespostas');
         print('---pontuação---$_pontuacao, $resposta');
      });
    }
  }

  void _reiniciar(){
    setState((){
      print('passei por aqui');
      listaDeRespostas = [];
      _perguntaSelecionada= 0;
      _pontuacao = 0;
    });
  }


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          backgroundColor: Colors.pink,
        ),
      body: temPerguntaSelecionada ? Column(
        children: <Widget>[
          Questionario(perguntas: _perguntas, perguntaSelecionada: _perguntaSelecionada, responder: _responder),
        ],

      ) : Resultado(_pontuacao, listaDeRespostas,_reiniciar),
      ),
    );
  }
}