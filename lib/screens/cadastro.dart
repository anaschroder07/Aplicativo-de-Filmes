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
        alignment: Alignment.center,
        child: Form(
          child: Column(
            
            children: [
              const Text("Cadastro", style: TextStyle(fontSize: 32),),
              usernameFormField(),
              emailFormField(),
              const SexFormField(),
              passwordFormField(),
              passwordConfirmationFormField(),
              Container(
                width: 170,
                height: 50,
                margin: const EdgeInsets.only(top: 20),
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

class SexFormField extends StatefulWidget {
  const SexFormField({super.key});

  @override
  State<SexFormField> createState() => _SexFormFieldState();
}

class _SexFormFieldState extends State<SexFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text("\nSexo",
            style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 165, 162, 152)),
            textAlign: TextAlign.right,
            ),
           ]
          ),
      RadioListTile(
      title: const Text("Feminino"),
      value: "Feminino",
      groupValue: genero,
      onChanged: (value) {   
          setState(() {
            genero = value.toString();
          });
        
      },),
      RadioListTile(
      title: const Text("Masculino"),
      value: "Masculino",
      groupValue: genero,
      onChanged: (value) {   
          setState(() {
            genero = value.toString();
          });
        
      },),
      RadioListTile(
      title: const Text("Outro"),
      value: "Outro",
      groupValue: genero, 
      onChanged: (value) {   
          setState(() {
            genero = value.toString();
          });
        
      },),

      ],
    );
  }
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