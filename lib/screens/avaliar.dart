import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trabalho1/logic/manage_local_db_event.dart';
import 'package:trabalho1/logic/monitor_local_db_bloc.dart';
import 'package:trabalho1/logic/monitor_local_db_event.dart';
import 'package:trabalho1/model/review.dart';
import 'package:trabalho1/screens/assistidos.dart';
import 'package:trabalho1/screens/catalogo.dart';

import '../logic/manage_local_db_bloc.dart';

final Review review = new Review();

class Avaliar extends StatelessWidget {
  Avaliar({super.key});

  final Review review = new Review();
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (providers: [
      BlocProvider(create: (_) => ManageBloc()),
      BlocProvider(create: (_) => MonitorBloc())
    ], 
    child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Form(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "Jonh Wick - Baba Yaga",
                      style: TextStyle(fontSize: 32),
                    )),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 300,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(0),
                  child: Image.network(
                      'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTvfkYNcjh7mncO6XPUlv611d5yqHUkGZMjGq8PXmKzGqeyC23A'),
                ),
                SizedBox(
                    width: 600,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                            "Com o preço por sua cabeça cada vez maior, o lendário assassino de aluguel John Wick leva sua luta contra o High Table global enquanto procura os jogadores mais poderosos do submundo, de Nova York a Paris, do Japão a Berlim."))),
                avaliacao(),
                const Nota(),
                ElevatedButton(
                  child: const Text("Enviar"),
                  onPressed: () {
                    Navigator.pop(context);
                    const snackBar = SnackBar(
                      content: Text(
                        'Sua avaliação foi salva com sucesso! :)',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.blueAccent,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    BlocProvider.of<ManageBloc>(context).add(SubmitEvent(review: review));
                    
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget avaliacao() {
  return SizedBox(
    width: 600,
    child: TextFormField(
      keyboardType: TextInputType.text,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira aqui sua avaliação";
          }
        }
        return null;
      },
      onSaved: (value){
        review.comment = value!;
      },
      decoration: const InputDecoration(
        labelText: "Avalie aqui",
      ),
    ),
  );
}

class Nota extends StatefulWidget {
  const Nota({super.key});

  @override
  State<Nota> createState() => _NotaState();
}

class _NotaState extends State<Nota> {
  double _currentSliderValue = 0;

  final _widgetsValues = Hive.box("widgets_values");
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Slider(
          value: (_widgetsValues.get('slider') == null
              ? _currentSliderValue
              : _widgetsValues.get('slider')),
          max: 5,
          divisions: 10,
          label: _widgetsValues.get('slider').toString(),
          onChanged: (double value) {
            setState(() {
              _widgetsValues.put('slider', value);
              _currentSliderValue = value;
            });
            review.stars = value;
          }),
    );
  }
}
