import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trabalho1/screens/avaliacoes.dart';
import 'package:trabalho1/screens/avaliar.dart';
import 'package:trabalho1/screens/cadastro.dart';
import 'package:trabalho1/screens/catalogo.dart';
import 'package:trabalho1/screens/login.dart';

import 'screens/avaliar.dart';
import 'bloc/reviews_bloc.dart';
import 'data/local/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("widgets_values");
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReviewsBloc>(
          create: (_) => ReviewsBloc(ReviewDataProvider()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
        ),
        home: const Login(title: 'Trabalho 0'),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _widgetsValues = Hive.box("widgets_values");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(0),
                child: const Text(
                  "Descrição",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(10),
                child: const Text(
                    "O projeto escolhido trata-se de uma plataforma para visualização e avaliação de filmes e séries que utiliza a API TMDB (The Movie Database) e armazena dados no banco de dados Firebase. O aplicativo permite ao usuário pesquisar por títulos de filmes e séries, visualizar informações sobre eles, como, por exemplo, descrição e elenco, além de permitir a avaliação dos títulos por meio de notas e comentários que serão armazenados em uma lista mantida no banco de dados."),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.all(0),
                    child: Image.network(
                        'https://m.media-amazon.com/images/I/81zDQ39P-jL.jpg'),
                  ),
                ],
              ),
              const Text("Login", style: TextStyle(fontSize: 32)),
              usernameFormField(),
              passwordFormField(),
              Container(
                width: 170,
                height: 50,
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  child: const Text("Logar"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyHomePage(title: "CineCriticas")));

                    const snackBar = SnackBar(
                      content: Text(
                        'Seja bem vindo de volta!!! :)',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.blueAccent,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
              Container(
                width: 170,
                height: 50,
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cadastrar()));
                  },
                  child: const Text(
                    "Cadastrar",
                  ),
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
      initialValue: _widgetsValues.get('user'),
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
      onChanged: (value) {
        _widgetsValues.put('user', value);
      },
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      initialValue: _widgetsValues.get('pwd'),
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
      onChanged: (value) {
        _widgetsValues.put('pwd', value);
      },
    );
  }
}
