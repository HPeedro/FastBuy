import 'package:flutter/material.dart';
import 'parent_page.dart';
import 'ProductScreen.dart';

class Child1Page extends StatefulWidget {
  final String title;
  final ValueChanged<String> child2Action3;
  final ValueChanged<String> child2Action2;

  const Child1Page({
    Key key,
    this.title,
    this.child2Action2,
    this.child2Action3,
  }) : super(key: key);

  @override
  Child1PageState createState() => Child1PageState();
}

class Child1PageState extends State<Child1Page> {
  String value = "Informações do Produto";
  String _nome, _preco;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            widget.title ?? value,
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Nome:'
            ),
            onSaved: (input) => _nome = input,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Preço:'
            ),
            onSaved: (input) => _preco = input,
            obscureText: true,
          ),
          RaisedButton(
            //Change Tab from Child 1 to Child 2
            child: Text("Pesquisar"),
            onPressed: () {
              _submit();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductScreen(),
                  )
              );
            },
          ),
          RaisedButton(
            //Change Tab from Child 1 to Child 2
            child: Text("Ver seu Carrinho"),
            onPressed: () {
              final controller = ParentProvider.of(context).tabController;
              controller.index = 1;
            },
          )
        ],
      ),
    );
  }
  void _submit(){
      //formKey.currentState.save();
      print(_nome);
      print(_preco);
  }
}
