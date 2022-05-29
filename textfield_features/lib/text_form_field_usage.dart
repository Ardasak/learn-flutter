import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldUsage extends StatefulWidget {
  TextFormFieldUsage({Key? key}) : super(key: key);

  @override
  State<TextFormFieldUsage> createState() => _TextFormFieldUsageState();
}

class _TextFormFieldUsageState extends State<TextFormFieldUsage> {
  String _email = "", _password = "", _username = "";
  final _formKey = GlobalKey<FormState>();

  IconData current_icon = Icons.visibility_off;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextFormField Usage")),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                  keyboardType: TextInputType.name,
                  onSaved: (deger){
                    _username = deger!;
                  },
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
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (deger){
                    _email = deger!;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  validator: (deger){
                    if(deger!.isEmpty){
                      return "Email can not be empty.";
                    } else if(EmailValidator.validate(deger)){
                      return null;
                    } else{
                      return "Email is invalid.";
                    }
                    
                  },
              ),
              SizedBox(height: 10,),
              TextFormField(
                obscureText: _obscureText,
                  keyboardType: TextInputType.text,
                  onSaved: (deger){
                    _password = deger!;
                  },
                  
                  decoration: InputDecoration(
                    suffix: IconButton(icon: Icon(current_icon,), onPressed: (){
                      if(current_icon == Icons.visibility_off){
                        current_icon = Icons.visibility;
                        _obscureText = false;
                        
                      }
                      else{
                        current_icon = Icons.visibility_off;
                        _obscureText = true;
                      }
                      setState(() {
                        
                      });
                    },
                    ),
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
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                }
                String result = "Username: $_username \nEmail: $_email \nPassword: $_password";
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result, style: TextStyle(fontSize: 15),)));
                _formKey.currentState!.reset();
              }, 
              child: Text("Confirm"))
            ],
          ),
        ),
      )),
    );
  }
}
