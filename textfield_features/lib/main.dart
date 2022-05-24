import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(title: "Form İşlemleri"));
}

class MyApp extends StatelessWidget {
  final String title;
  const MyApp({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(title: Text(title)),
        body: Column(
          children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.search,
              autofocus: true,
              maxLines: 1,
              maxLength: 8,
              onChanged: (String deger) => print(deger + "basıldı."),
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                labelText: "Test",
                hintText: "Email Giriniz.",
                icon: Icon(Icons.email),
                prefixIcon: Icon(Icons.email_outlined),
                suffixIcon: Icon(Icons.email_rounded),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                filled: true,
                fillColor: Colors.orange
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.search,
            ),
          )],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
    
          },
          child: Icon(Icons.edit)
          ,),
      ),
    );
  }
}