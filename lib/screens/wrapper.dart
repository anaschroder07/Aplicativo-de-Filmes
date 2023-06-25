import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho1/screens/assistidos.dart';
import 'package:trabalho1/screens/cadastro.dart';
import 'package:trabalho1/screens/catalogo.dart';
//import 'package:trabalho1/screens/login.dart';
//imageFeature
//import '../bloc/manage_bloc.dart';
//import '../bloc/monitor_bloc.dart';
//import 'add_note.dart';
//import 'list_note.dart';
import '../bloc/manage_db_bloc.dart';
//import '../bloc/monitor_db_bloc.dart';
import '../main.dart';
import '../bloc/auth_bloc.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    mostrar() {
      const snackBar = SnackBar(
        content: Text(
          'Seja bem vindo de volta!!! :)',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro do Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return authenticatedWidget(context);
        } else {
          return unauthenticatedWidget(context);
        }
      },
    );
  }
}

Widget authenticatedWidget(BuildContext context) {
  return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(Logout());
            },
            child: const Icon(Icons.logout)),
        body: const MyHomePage(title: "CineCríticas"),
      ));
}

Widget unauthenticatedWidget(BuildContext context) {
  return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            Login(
              title: "Login",
            ),
            Cadastrar(),
          ],
        ),
        appBar: AppBar(
          title: const Text("CineCríticas"),
          bottom: const TabBar(
            tabs: [Tab(text: "Efetuar Login"), Tab(text: "Novo Cadastro")],
          ),
        ),
      ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManageBloc, ManageState>(
      listener: (BuildContext context, ManageState state) {
        if (state is UpdateState) {
          setState(() {
            _currentScreen = 1;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: IndexedStack(
            index: _currentScreen, children: [Catalogo(), Assistidos()]),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_movies), label: "Catálogo de Filmes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.remove_red_eye_outlined),
                label: "Filmes Assistidos")
          ],
          currentIndex: _currentScreen,
          onTap: (value) {
            setState(() {
              _currentScreen = value;
            });
          },
        ),
      ),
    );
  }
}
