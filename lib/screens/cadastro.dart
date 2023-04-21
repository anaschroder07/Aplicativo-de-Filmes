import 'dart:html';

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
              emailFormField(),
              sexoFormField(1),
              passwordFormField(),
              passwordConfirmationFormField(),
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
      keyboardType: TextInputType.name,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Nome de usuário";
          }
        }
        return null;
      },
      
      decoration: const InputDecoration(
        hintText: "Insira seu username",
        labelText: "Nome de usuário",
      ),
    );
  }

Widget emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira seu email";
          }
        }
        return null;
      },
      
      decoration: const InputDecoration(
        hintText: "user@domain.br",
        labelText: "E-mail",
      ),
    );
  }

String? genero;

  Widget sexoFormField(int value){
    return Column(
      children: [
        RadioListTile(
      title: Text("Feminino"),
      value: "Feminino",
      groupValue: genero, // Valor do grupo
      onChanged: (value) {   
          /*setState(() {
            genero = value.toString();
          });*/
        
      },),
      RadioListTile(
      title: Text("Masculino"),
      value: "Masculino",
      groupValue: genero, // Valor do grupo
      onChanged: (value) {   
          /*setState(() {
            genero = value.toString();
          });*/
        
      },),
      RadioListTile(
      title: Text("Outro"),
      value: "Outro",
      groupValue: genero, // Valor do grupo
      onChanged: (value) {   
          /*setState(() {
            genero = value.toString();
          });*/
        
      },),

      ],
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
        labelText: "Senha",
      ),
    );
  }

    Widget passwordConfirmationFormField() {
    return TextFormField(
      obscureText: true,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.length < 10) {
            return "Confirme sua senha";
          }
        }
        return null;
      },
      
      decoration: const InputDecoration(
        labelText: "Confirme sua senha",
      ),
    );
  }