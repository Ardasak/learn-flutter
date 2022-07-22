import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_http/models/user.dart';

class RemoteApi extends StatefulWidget {
  RemoteApi({Key? key}) : super(key: key);

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  List<User> userList = [];
  Future<List<User>> _getUserList() async {
    try {
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        userList = (response.data as List).map((e) => User.fromMap(e)).toList();
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
    return userList;
  }

  late Future<List<User>> userListe;

  @override
  void initState() {
    super.initState();
    userListe = _getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Remote API"),
        ),
        body: Center(
          child: FutureBuilder<List<User>>(
            future: userListe,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var userList = snapshot.data!;
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (content, index) {
                      var user = userList[index];
                      return ListTile(
                        title: Text(user.email),
                        subtitle: Text(user.address.toString()),
                        leading: Text(user.id.toString()),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
