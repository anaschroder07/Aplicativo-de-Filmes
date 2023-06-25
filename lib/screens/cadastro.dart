import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import '../bloc/auth_bloc.dart';
import '../main.dart';

String filePNG = "";
String username = "";
String email = "";
String password = "";
String userImageUrl =
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fmundoeducacao.uol.com.br%2Fbiologia%2Fcapivara.htm&psig=AOvVaw1PTM1C4yg72qDozJSeJsxN&ust=1687733841701000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLCNveiA3f8CFQAAAAAdAAAAABAD"; // Variável para armazenar a URL da imagem cadastrada

class Cadastrar extends StatefulWidget {
  Cadastrar({Key? key}) : super(key: key);

  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  final _widgetsValues = Hive.box("widgets_values");

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) {
      return;
    }

    String fileName = username.toString();
    filePNG = fileName;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/$fileName');

    await ref.putFile(_imageFile!);

    userImageUrl = await ref.getDownloadURL();
    //_widgetsValues.put("userImageUrl", userImageUrl.toString());

    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                _imageFile != null
                    ? Image.file(_imageFile!)
                    : Text('Nenhuma imagem selecionada'),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  child: Text('Tirar Foto'),
                ),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child: Text('Selecionar da Galeria'),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 170,
                  height: 50,
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    child: const Text("Cadastrar"),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        BlocProvider.of<AuthBloc>(context).add(RegisterUser(
                          username: username,
                          password: password,
                        ));
                        _uploadImage();
                      }
                    },
                  ),
                ),
              ],
            ),
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
  const SexFormField({Key? key}) : super(key: key);

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
