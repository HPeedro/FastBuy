import 'package:flutter/material.dart';
import 'child1_page.dart';
import 'child2_page.dart';
import 'LoginScreen.dart';

import 'globals.dart' as globals;

class ParentPage extends StatefulWidget {
  @override
  ParentPageState createState() => ParentPageState();
}

class ParentProvider extends InheritedWidget {
  final TabController tabController;
  final Widget child;
  final String title;

  ParentProvider({
    this.tabController,
    this.child,
    this.title,
  });

  @override
  bool updateShouldNotify(ParentProvider oldWidget) {
    return true;
  }

  static ParentProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(ParentProvider);
}

class ParentPageState extends State<ParentPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  String myTitle = "PUC-Shop";
  String updateChild2Title;
  String updateChild1Title;

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  updateChild2(String text) {
    setState(() {
      updateChild2Title = text;
    });
  }

  updateParent(String text) {
    setState(() {
      myTitle = text;
    });
  }

  updateUserInfo() {

    setState(() {
//      myTitle = globals.isLoggedIn.toString();
      myTitle = globals.user['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ParentProvider(
      tabController: _controller,
      title: updateChild2Title,
      child: Column(
        children: [
          ListTile(
            title: Text(
              myTitle,
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
              child: Text('Login'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    )
                );
                updateUserInfo();
              }
          ),
          TabBar(
            controller: _controller,
            tabs: [
              Tab(
                text: "Procurar Produtos",
                icon: Icon(Icons.check_circle),
              ),
              Tab(
                text: "Carrinho",
                icon: Icon(Icons.crop_square),
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                Child1Page(),
                Child2Page(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
