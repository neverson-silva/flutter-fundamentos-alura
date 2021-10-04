import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar = "Transferências";

class ListaTransafencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransafencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          return ItemTransferencia(widget._transferencias[indice]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          );
          future.then((value) {
            _atualiza(value);
          });
        },
      ),
    );
  }

  void _atualiza(Transferencia? value) {
    if (value != null) {
      setState(() {
        widget._transferencias.add(value);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString())),
    );
  }
}
