import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Produtos'),
        ),
        body: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: _submit,
                  child: Text('Adicionar ao Carrinho'),
                ),
              )
            ],
          )
        )
    );
  }
  void _submit(){
      //formKey.currentState.save();
      print(_email);
      print(_password);
  }
}