import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:trabalho1/screens/assistidos.dart';
//import 'package:trabalho1/screens/catalogo.dart';

import '../bloc/manage_db_bloc.dart';
import '../model/note.dart';
import 'catalogo.dart';

final _widgetsValues = Hive.box("widgets_values");

class Avaliar extends StatefulWidget {
  final Movie movie;
  const Avaliar({super.key, required this.movie});

  @override
  State<Avaliar> createState() => _AvaliarState();
}

final ratingController = TextEditingController();

class _AvaliarState extends State<Avaliar> {
  final GlobalKey<FormState> formkey = GlobalKey();

  final reviewController = TextEditingController();
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
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.movie.title,
                        style: TextStyle(fontSize: 32),
                      )),
                  Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 300,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(0),
                    child: Image.network(widget.movie.imageUrl),
                  ),
                  SizedBox(
                      width: 600,
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(widget.movie.description))),
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
            review.stars = value;
          }),
    );
  }
}
