import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../main.dart';
import 'avaliacoes.dart';
import 'catalogo.dart';

class Inicial extends StatelessWidget {
  const Inicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              
            },
            child: const Text("jonas")),
      ]
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: IndexedStack(
          index: _currentScreen,
          children: const [
            Inicial(),
            Catalogo(),
            Avaliacoes()
          ]
        ),
        /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            //Catalogo(),
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),*/
      ),
      drawer: Drawer(
        child: ListView(children: [
          const SizedBox(
            height: 60,
            child: DrawerHeader(            
              margin: EdgeInsets.all(0.0),  
              child: Text("Menu", style: TextStyle(fontSize: 26),),
                      
            ),

          ),
          ListTile(
            title: const Text("Inicial"),
            onTap: (){
              setState(() {
                _currentScreen = 0;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Catálogo"),
            onTap: (){
              setState(() {
                _currentScreen = 1;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Avaliações"),
            onTap: (){
              setState(() {
                _currentScreen = 2;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Assistidos"),
            onTap: (){
              setState(() {
                _currentScreen = 3;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Conta"),
            onTap: (){
              setState(() {
                _currentScreen = 4;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: (){
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  Login(title: "Cadastro",)));
            },
          ),
        ]),
      ),
      
    );
  }
}


