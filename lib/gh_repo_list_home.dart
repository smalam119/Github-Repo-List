import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gh_repo_list/repo.dart';
import 'strings.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class GHRepoListHomePage extends StatefulWidget {
  createState() => GHRepoListState();
}

class GHRepoListState extends State<GHRepoListHomePage> {
  var _repolist = <Repo>[];
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Please enter github user name',
                        hintStyle: TextStyle(color: Colors.grey),
                      ))),
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

  _loadData(String username) async {
    String url = "https://api.github.com/users/${username}/repos";
    http.Response response = await http.get(url);
    setState(() {
      final statusCode = response.statusCode;
      if (statusCode == 404) {
        Fluttertoast.showToast(
            msg: "user name not found",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER);
        return;
      } else if (statusCode != 200) {
        Fluttertoast.showToast(
            msg: "something went wrong. try again later",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER);
            return;
      }
      final repoListJSON = json.decode(response.body);
      for (var repoJSON in repoListJSON) {
        final repo =
            Repo(repoJSON["id"], repoJSON["name"], repoJSON["description"]);
        _repolist.add(repo);
        print("name: ${repo.name}");
      }
    });
  }

  _onPressOkayButton() {
    final username = textEditingController.text;
    _loadData(username);
  }
}
