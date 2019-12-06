import 'dart:convert';

import 'LoginScreen.dart';

import 'package:flutter/material.dart';
import 'parent_page.dart';

import 'package:http/http.dart';

import 'globals.dart' as globals;

class Child1Page extends StatefulWidget {
  final String title;

  const Child1Page({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Child1PageState createState() => Child1PageState();
}

class Child1PageState extends State<Child1Page> {
  String value = "Produtos disponiveis";




  @override
  Widget build(BuildContext context) {
    final title = ParentProvider.of(context).title;

    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          builder: (context, projectSnap) {
            if ((projectSnap.connectionState == ConnectionState.waiting)) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Text('Waiting...');
            }
            List<dynamic> prod = jsonDecode(projectSnap.data.toString());
//            globals.product = prod;
//            print('DATA: '+prod.elementAt(0).toString());
            return ListView.builder(
              itemCount: prod.length,
              itemBuilder: (context, index) {
                List<dynamic> prodl = jsonDecode(projectSnap.data.toString());
                Map<String, dynamic> prod = jsonDecode(jsonEncode(prodl.elementAt(index)));
                //print('GLOBALS: '+globals.product.values.elementAt(0));
                return Column(
                  children: [
                    RaisedButton(
                        child: Text(prod['title']+' | '+prod['price'].toString()+' R\$'),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                            if(globals.isLoggedIn){
                              _postCarrinho(prod['_id']);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => LoginScreen(),
                                  )
                              );
                            }
                        }
                    ),
                    // Widget to display the list of project
//                    Text(prod['title']),
                  ],
                );
              },
            );
          },
          future: _makeList(),
        )
    );

  }

  Future _postCarrinho(String _id) async{

  }

  Future _makeList() async{
    String url = 'http://'+globals.ip+':3000/products';
    Response response = await get(url);
    print('HTTP_SC: '+response.statusCode.toString());
    return response.body;
  }

}

