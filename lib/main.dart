import 'package:flutter/material.dart';
import 'package:trabalho1/screens/avaliacoes.dart';
import 'package:trabalho1/screens/cadastro.dart';
import 'package:trabalho1/screens/catalogo.dart';
import 'package:trabalho1/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.black,
      ),
      home: Login(title: 'Trabalho 0'),
    );
  }
}

class Login extends StatefulWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Login({super.key, required this.title});


  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        //width: 300,
        alignment: Alignment.center,
        child: Form(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Login", style: TextStyle(fontSize: 32),),
              usernameFormField(),
              passwordFormField(),
              Container(
                width: 170,
                height: 50,
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  child: const Text("Logar"),
                  onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyHomePage(title: "CineCriticas")));
                  },
                ),
              ),
              Container(
                width: 170,
                height: 50,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: const Text("Cadastrar"),
                  onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cadastrar()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}

Widget usernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira um nome de usuário";
          }
        }
        return null;
      },
      
      decoration: const InputDecoration(
        hintText: "user@domain.br",
        labelText: "Username (E-mail Address)",
      ),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.length < 10) {
            return "Mínimo de 10 letras";
          }
        }
        return null;
      },
      
      decoration: const InputDecoration(
        labelText: "Insira uma senha forte",
      ),
    );
  }


