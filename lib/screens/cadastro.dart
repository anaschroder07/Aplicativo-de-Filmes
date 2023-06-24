import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../bloc/auth_bloc.dart';
import '../main.dart';

  String username = "";
  String email = "";
  String password = "";

class Cadastrar extends StatelessWidget {
  Cadastrar({super.key});

  final _widgetsValues = Hive.box("widgets_values");

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Form(
          key: formkey,
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
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      BlocProvider.of<AuthBloc>(context).add(RegisterUser(username: username, password: password));
                    }
                    
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  title: "Cadastro",
                                )));*/
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
      onSaved: (String? inValue) {
        username = inValue!;
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
      onSaved: (String? inValue) {
        email = inValue!;
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
      onSaved: (String? inValue) {
          password = inValue!;
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
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
