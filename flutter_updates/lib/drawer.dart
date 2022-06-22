import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(children: [
            UserAccountsDrawerHeader(
                accountName: Text("Test"), accountEmail: Text("test@gmail.com"),
                currentAccountPicture: Image.network("https://i.ytimg.com/vi/xEuX6HCUFWI/maxresdefault.jpg", fit: BoxFit.cover,),
                otherAccountsPictures: [
                  CircleAvatar(backgroundColor: Colors.yellow, child: Text("AS"),),
                  CircleAvatar(backgroundColor: Colors.green, child: Text("EA"),)
                ],),
            Expanded(
              child: ListView(
                children: [
                  ListTile(leading: Icon(Icons.home), title: Text("Home"), trailing: Icon(Icons.chevron_right),),
                  ListTile(leading: Icon(Icons.call), title: Text("Call"), trailing: Icon(Icons.chevron_right),),
                  ListTile(leading: Icon(Icons.account_box), title: Text("Profile"), trailing: Icon(Icons.chevron_right),),
                  Divider(),
                  InkWell(
                    onTap: (){
                      debugPrint("Nice");
                    },
                    splashColor: Colors.cyan,
                    child: ListTile(leading: Icon(Icons.home), title: Text("Home"), trailing: Icon(Icons.chevron_right),),
                  ),
                  AboutListTile(
                    applicationName: "Flutter Dersleri",
                    applicationVersion: "2.0",
                    applicationIcon: Icon(Icons.flutter_dash),
                    child: Text("About Us"),
                    applicationLegalese: "Legalese",
                    icon: Icon(Icons.question_mark),
                    dense: true,
                    aboutBoxChildren: [
                      Text(("Test")),
                      Text("Test")
                    ],
                  )
                ],
              ),
            )
          ]),
        );
  }
}