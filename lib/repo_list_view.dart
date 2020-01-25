import 'package:flutter/material.dart';
import 'package:gh_repo_list/repo.dart';

class RepoListView extends StatefulWidget {
  var _repoList = <Repo>[];

  RepoListView(this._repoList);

  @override
  createState() => RepoListViewState(_repoList);
}

class RepoListViewState extends State<RepoListView> {
  var _repoList = <Repo>[];

  RepoListViewState(this._repoList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _repoList.length * 2,
      itemBuilder: (BuildContext context, int position) {
        if (position.isOdd) return Divider();
        final index = position ~/ 2;
        return _buildRow(index);
      },
    );
  }

  Widget _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text("${_repoList[i].name}"),
      ),
    );
  }
}
