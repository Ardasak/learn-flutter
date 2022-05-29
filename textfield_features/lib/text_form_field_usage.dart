import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldUsage extends StatefulWidget {
  TextFormFieldUsage({Key? key}) : super(key: key);

  @override
  State<TextFormFieldUsage> createState() => _TextFormFieldUsageState();
}

class _TextFormFieldUsageState extends State<TextFormFieldUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextFormField Usage")),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                  initialValue: "Ardasak",
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  validator: (deger){
                    if (!(deger!.length < 4)){
                      return null;
                    }else{
                      return "Username cannot be shorter than 4 characters.";
                    }
                    
                  },),
                  SizedBox(
                    height: 10,
                  ),
              TextFormField(
                initialValue: "ardasak434@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.orange),
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Email",
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  validator: (deger){
                    if(EmailValidator.validate(deger!)){
                      return null;
                    }else{
                      return "Email is invalid.";
                    }
                    
                  },
              ),
              SizedBox(height: 10,),
              TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  validator: (deger){
                    if(!(deger!.length < 6)){
                      return null;
                    }else{
                      return "Password must be at least 6 characters.";
                    }
                    
                  },
              ),
              TextFormField(),
            ],
          ),
        ),
      )),
    );
  }
}
