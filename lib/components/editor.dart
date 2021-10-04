import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  Editor({
    required this.controlador,
    required this.rotulo,
    required this.dica,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: rotulo,
          hintText: dica,
          icon: icone != null ? Icon(icone) : null,
        ),
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}
