import 'package:flutter/material.dart';
import 'package:flutter_updates/custom_font_usage.dart';
import 'package:flutter_updates/drawer.dart';
import 'package:flutter_updates/ui/main_menu.dart';
import 'package:flutter_updates/ui/search_page.dart';

class FlutterPart2 extends StatelessWidget {
  const FlutterPart2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = new ThemeData(primarySwatch: Colors.teal);

    return MaterialApp(
        theme: theme.copyWith(
            colorScheme:
                theme.colorScheme.copyWith(secondary: Colors.orangeAccent)),
        debugShowCheckedModeBanner: false,
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedMenuItem = 0;
  late List<Widget> allPages;
  late MainPage mainPage;
  late SearchPage searchPage;

  var keyAnaSayfa = PageStorageKey("key_ana_sayfa");
  var keyAramaSayfa = PageStorageKey("key_arama_sayfa");
 
  @override
  void initState() {
    mainPage = MainPage(key: keyAnaSayfa,);
    searchPage = SearchPage(key: keyAramaSayfa,);
    allPages = [mainPage, searchPage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavMenu(),
        drawer: DrawerMenu(),
        appBar: AppBar(
          title: const Text('Flutter Bölüm 2'),
        ),
        body: ternary_try_catch((){
          allPages.contains(allPages[selectedMenuItem]);
        }) ? allPages[selectedMenuItem] : allPages[0]);
  }

  BottomNavigationBar BottomNavMenu() {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "Profile",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "Profile",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "Profile",
              backgroundColor: Colors.purple),
        ],
        onTap: (value) {
          selectedMenuItem = value;
          setState(() {});
        },
        backgroundColor: Colors.cyan.shade800,
        currentIndex: selectedMenuItem,
        fixedColor: Colors.yellow,
        type: BottomNavigationBarType.fixed,
      );
  }
}

bool ternary_try_catch(Function toRun){
  try{
    toRun();
    return true;
  }
  catch(e){
    return false;
  }
}

void main() {
  runApp(const FlutterPart2());
}
