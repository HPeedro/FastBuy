import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart';

import 'globals.dart' as globals;
import 'parent_page.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String _email, _password, _error_login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
        body: Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email:'
                    ),
                    validator: (input) => !input.contains('@') ? 'Not a valid Email' : null,
                    onSaved: (input) => _email = input,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password:'
                    ),
                    validator: (input) => input.length < 3 ? 'You need at least 8 characters' : null,
                    onSaved: (input) => _password = input,
                    obscureText: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.all(0.0),
//                        child: Text('User $_error_login'),
//                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: (){
                            _submit(context);
                          },
                          child: Text('Sign in'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
  Future<void> _submit(BuildContext context) async {
    if(formKey.currentState.validate()){
      formKey.currentState.save();

      String url = 'http://192.168.0.103:3000/user';
      Response response = await get(url);


      if(response.body.contains(new RegExp(r'{[^}]*?"email":"'+_email.trim()+'"[^}]*?"senha":"'+_password.trim()+'"[^}]*?}')) || response.body.contains(new RegExp(r'{[^}]*?"senha":"'+_password.trim()+'"[^}]*?"email":"'+_email.trim()+'"[^}]*?}'))){
        RegExp _regex = new RegExp(r'({[^}]*?"email":"'+_email.trim()+'"[^}]*?"senha":"'+_password.trim()+'"[^}]*?})|({[^}]*?"senha":"'+_password.trim()+'"[^}]*?"email":"'+_email.trim()+'"[^}]*?})');
        String _json = _regex.stringMatch(response.body);

        Map<String, dynamic> user = jsonDecode(_json);
        globals.user = user;
        globals.isLoggedIn = true;
        Navigator.pop(context);

      } else {
        print('User or password is incorrect');
      }
    }
  }
}