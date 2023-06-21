//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../main.dart';

class Cadastrar extends StatelessWidget {
  Cadastrar({super.key});

  final _widgetsValues = Hive.box("widgets_values");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Form(
          child: Column(
            children: [
              const Text(
                "Cadastro",
                style: TextStyle(fontSize: 32),
              ),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  title: "Cadastro",
                                )));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameFormField() {
    return TextFormField(
      initialValue: _widgetsValues.get('username'),
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
      onChanged: (value) {
        _widgetsValues.put('username', value);
      },
    );
  }

  Widget emailFormField() {
    return TextFormField(
      initialValue: _widgetsValues.get('email'),
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
      onChanged: (value) {
        _widgetsValues.put('email', value);
      },
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      initialValue: _widgetsValues.get('password'),
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
      onChanged: (value) {
        _widgetsValues.put('password', value);
      },
    );
  }

  Widget passwordConfirmationFormField() {
    return TextFormField(
      initialValue: _widgetsValues.get('password2'),
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
      onChanged: (value) {
        _widgetsValues.put('password2', value);
      },
    );
  }
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
        const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            "\nSexo",
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 165, 162, 152)),
            textAlign: TextAlign.right,
          ),
        ]),
        RadioListTile(
          title: const Text("Feminino"),
          value: "Feminino",
          groupValue: genero,
          onChanged: (value) {
            setState(() {
              genero = value.toString();
            });
          },
        ),
        RadioListTile(
          title: const Text("Masculino"),
          value: "Masculino",
          groupValue: genero,
          onChanged: (value) {
            setState(() {
              genero = value.toString();
            });
          },
        ),
        RadioListTile(
          title: const Text("Outro"),
          value: "Outro",
          groupValue: genero,
          onChanged: (value) {
            setState(() {
              genero = value.toString();
            });
          },
        ),
      ],
    );
  }
}
