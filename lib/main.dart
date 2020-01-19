import 'package:flutter/material.dart';
import 'gh_repo_list_home.dart';
import 'strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.title,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: GHRepoListHomePage(),
    );
  }
}


