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
      body: Stack(
        children:[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/correndo.jpeg', fit: BoxFit.cover,)
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/logo_RGB.png'),
            ),
            Padding(
                padding: const EdgeInsets.only(left:12, right: 12, top: 20, bottom: 12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children:  [
                        Container(height: 20),
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
                  ),
                
                ),
              ),
          
          ],
        ),
        ] 
      ),
      );
  }
}