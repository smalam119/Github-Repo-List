import 'package:flutter/material.dart';
import 'strings.dart';

class GHRepoListHomePage extends StatefulWidget {
  createState() => GHRepoListState();
}

class GHRepoListState extends State<GHRepoListHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(16.0), child: TextField()),
              RaisedButton(
                child: Text("Okay"),
                color: Colors.indigo,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
                onPressed: _onPressOkayButton,
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(title: Text('Android App')),
                    ListTile(title: Text('iOS App'))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _onPressOkayButton() {
    print("Okay button pressed");
  }
}
