import 'package:flutter/material.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/network/NetworkClient.dart';
import 'dart:convert';

class UserListView extends StatefulWidget {
  @override
  createState() => _UserListViewState();
}

class _UserListViewState extends State {
  var users = new List<User>();

  void _getUsers() {
    NetworkClient.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromeJSON(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(users[index].name));
        },
      ),
    );
  }
}
