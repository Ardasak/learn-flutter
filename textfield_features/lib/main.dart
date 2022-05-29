import 'package:flutter/material.dart';
import 'package:textfield_features/text_form_field_usage.dart';

void main() {
  runApp(MyApp(title: "Form İşlemleri"));
}

class MyApp extends StatefulWidget {
  final String title;
  const MyApp({Key? key, required this.title}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  int maxLine = 1;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "test@test.com");
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
      if(_focusNode.hasFocus){
        maxLine = 3;
      }
      else{
        maxLine = 1;
      }
            
    });
    
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextFormFieldUsage(),
    );
  }

  Scaffold TextFieldUsage() {
    return Scaffold(
      
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.search,
            autofocus: true,
            maxLines: maxLine,
            maxLength: 35,
            onChanged: (String deger) {setState((){
              _controller.value = TextEditingValue(
                text: deger, 
                selection: TextSelection.collapsed(offset: deger.length));
                });},
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
          child: Text(_controller.text),
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
          _controller.text = "ardasak434@gmail.com";
          setState(() {
            
          });
        },
        child: Icon(Icons.edit)
        ,),
    );
  }
}