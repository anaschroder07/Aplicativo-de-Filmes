import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import '../bloc/auth_bloc.dart';
import '../main.dart';

String caminho = "";
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
    caminho = ref.fullPath;

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
                const SexFormField(),
                passwordFormField(),
                passwordConfirmationFormField(),
                SizedBox(height: 16),
                _imageFile != null
                    ? ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxWidth: 200, maxHeight: 200),
                        child: Image.file(_imageFile!))
                    : const Text('Nenhuma imagem selecionada'),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 56.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            blurRadius: 3.0,
                            //offset: const Offset(2, 2,),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () => _pickImage(ImageSource.camera),
                        icon: const Icon(Icons.photo_camera),
                        iconSize: 32.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50),
                    Container(
                      width: 56.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            blurRadius: 3.0,
                            //offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        icon: const Icon(Icons.photo_album),
                        iconSize: 32.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
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
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira seu e-mail";
          }
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "user@domain.br",
        labelText: "E-mail",
      ),
      onChanged: (value) {
        _widgetsValues.put('username', value);
      },
      onSaved: (String? inValue) {
        username = inValue!;
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
