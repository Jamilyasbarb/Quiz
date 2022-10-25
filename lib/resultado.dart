import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{
  final int pont;
  final void Function() reiniciar;
  final List<String> resposta;

  const Resultado(this.pont, this.resposta, this.reiniciar,{super.key});

String get fraseResuldado{
  if(pont < 8){
    return 'Parabéns';
  }else if(pont < 12){
    return 'Você é demais';
  }else if(pont < 18){
    return 'Você tem bom gosto';
  }else{
    return 'Nível Jedi';
  }
}

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(fraseResuldado, style: const TextStyle(fontSize: 30,)),
          Text('Sua pontuação foi $pont', style: const TextStyle(fontSize: 30,)),
          ListView.builder(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: resposta.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: Colors.pink[50],
                  child: Center(child: Text(resposta[index])),
                ),
              );
            }
            ),
          ),

          TextButton(onPressed: reiniciar, child: const Text('Reiniciar?'))
        ],
      ),
    );
  }
}