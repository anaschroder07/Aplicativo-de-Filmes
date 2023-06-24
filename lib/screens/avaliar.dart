import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trabalho1/screens/assistidos.dart';
import 'package:trabalho1/screens/catalogo.dart';

import '../bloc/manage_db_bloc.dart';
import '../model/note.dart';

final _widgetsValues = Hive.box("widgets_values");

class Avaliar extends StatefulWidget {
  const Avaliar({super.key});

  @override
  State<Avaliar> createState() => _AvaliarState();
}

final ratingController = TextEditingController();

class _AvaliarState extends State<Avaliar> {
  final GlobalKey<FormState> formkey = GlobalKey();

  final reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ManageBloc blocInstance = BlocProvider.of<ManageBloc>(context);
    return BlocListener<ManageBloc, ManageState>(
      bloc: blocInstance,
      listener: (context, state) {
        if (state is UpdateState) {
          reviewController.text = state.previousNote.review == null
              ? "Não avaliado"
              : state.previousNote.review.toString();
          ratingController.text = state.previousNote.rating == null
              ? "Não avaliado"
              : state.previousNote.rating.toString();
        }
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Form(
            key: formkey,
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
                    //child: const Text("Enviar"),
                    onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    String review = _widgetsValues.get('review') == null
                        ? "Sem avaliação"
                        : _widgetsValues.get('review').toString();
                    String rating = _widgetsValues.get('rating') == null
                        ? "Sem avaliação"
                        : _widgetsValues.get('rating').toString();

                    Note note = Note.withData(review: review, rating: rating);
                    BlocProvider.of<ManageBloc>(context).add(SubmitEvent(
                      note: note,
                    ));
                    reviewController.text = "";
                    ratingController.text = "";
                  }

                  Navigator.pop(context);

                  const snackBar = SnackBar(
                    content: Text(
                      'Sua avaliação foi salva com sucesso! :)',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.blueAccent,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }, child: BlocBuilder<ManageBloc, ManageState>(
                  builder: (context, state) {
                    return (state is UpdateState
                        ? const Text("Update")
                        : const Text(
                            "Insert",
                          ));
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget avaliacao() {
    return SizedBox(
      width: 600,
      child: TextFormField(
        controller: reviewController,
        keyboardType: TextInputType.text,
        validator: (String? inValue) {
          if (inValue != null) {
            if (inValue.isEmpty) {
              return "Insira aqui sua avaliação";
            }
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: "Avalie aqui",
        ),
      ),
    );
  }
}

class Nota extends StatefulWidget {
  const Nota({super.key});

  @override
  State<Nota> createState() => _NotaState();
}

class _NotaState extends State<Nota> {
  double _currentSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Slider(
          //controller: ratingController,
          value: (_widgetsValues.get('slider') == null
              ? _currentSliderValue
              : _widgetsValues.get('slider')),
          max: 5,
          divisions: 10,
          label: "jonas", //(_widgetsValues.get('slider') ?? 0.0).toString(),
          onChanged: (double value) {
            setState(() {
              _widgetsValues.put('slider', value);
              _currentSliderValue = value;
              ratingController.text = _widgetsValues.get('rating') == null
                  ? "Sem avaliação"
                  : _widgetsValues.get('rating').toString();
            });
          }),
    );
  }
}
