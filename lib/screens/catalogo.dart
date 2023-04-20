import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Catalogo extends StatelessWidget {
  const Catalogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              
            },
            child: const Text("Oi lindo")),
      ]
    );
  }
}