import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  bool erroNoLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image.asset('assets/logo_negativa_s.png'),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children:  [
                     TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: const OutlineInputBorder(),
                          errorText: erroNoLogin ? '' : '',
                        ),
                        onChanged: (value) {
                        email = value;
                      },
                    ),
                      Container(
                        height: 20,
                      ),
                    TextField(
                      obscureText: true,
                      decoration:  InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(), fillColor: Colors.pink,
                        errorText: erroNoLogin ? 'Email ou senha incorretos, tente novamente.' : '',
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
        ElevatedButton(
          onPressed: (){
            if(email== 'mily.yasbarb@gmail.com' && password == '123'){
              Navigator.of(context).pushReplacementNamed('/perguntaApp');
            }else{
              setState(() {
                erroNoLogin = true;
              });
            }
          }, child: const Text('Entrar'),
        ),
        ],
      ),
      );
  }
}

class PlanoDeFundo extends StatelessWidget {
  const PlanoDeFundo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LoginPage(),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black
        ),
      ],
    );
  }
}
