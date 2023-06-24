import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trabalho1/screens/wrapper.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/manage_db_bloc.dart';
import 'bloc/monitor_db_bloc.dart';
//import 'screens/avaliacoes.dart';
//import 'screens/avaliar.dart';
//import 'screens/cadastro.dart';
//import 'screens/catalogo.dart';
//import 'screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool firebaseInitialized = false;

  // Verificar se o Firebase já foi inicializado
  if (!firebaseInitialized) {
    await Firebase.initializeApp(
      name: "trabalho1",
      options: const FirebaseOptions(
        apiKey: "AIzaSyAf9Ym-XcGNs2fOKELFh87T5jwJlj9mA8g",
        appId: "1:363196064267:web:59f62da0fef12543741d0e",
        messagingSenderId: "363196064267",
        projectId: "aplicativo-de-filmes-1e72a",
        authDomain: "aplicativo-de-filmes-1e72a.firebaseapp.com",
        storageBucket: "aplicativo-de-filmes-1e72a.appspot.com",
      ),
    );

    firebaseInitialized = true;
  }
  await Hive.initFlutter();
  await Hive.openBox("widgets_values");
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => ManageBloc()),
    BlocProvider(create: (_) => MonitorBloc()),
  ], child: const MyApp()));
}

String username = "";
String password = "";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc()),
          ],
          child: const Wrapper(),
        )
        //Login(title: 'Trabalho 0'),
        );
  }
}

class Login extends StatefulWidget {
  Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final _widgetsValues = Hive.box("widgets_values");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Form(
            key: formkey,
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
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        BlocProvider.of<AuthBloc>(context).add(
                            LoginUser(username: username, password: password));
                      }
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyHomePage(title: "CineCriticas")));*/

                      /*const snackBar = SnackBar(
                        content: Text(
                          'Seja bem vindo de volta!!! :)',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.blueAccent,
                      );*/
                      //ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
      onSaved: (String? inValue) {
        username = inValue!;
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
      onSaved: (String? inValue) {
        password = inValue!;
      },
    );
  }
}
