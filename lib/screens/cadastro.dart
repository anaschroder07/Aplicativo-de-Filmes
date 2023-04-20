import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../main.dart';

class Cadastrar extends StatelessWidget {
  const Cadastrar({super.key});

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
              const Text("Cadastro", style: TextStyle(fontSize: 32),),
              usernameFormField(),
              passwordFormField(),
              Container(
                width: 170,
                height: 50,
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  child: const Text("Cadastrar"),
                  onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  Login(title: "Cadastro",)));
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