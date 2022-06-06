import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class StepperUsage extends StatefulWidget {
  StepperUsage({Key? key}) : super(key: key);

  @override
  State<StepperUsage> createState() => _StepperUsageState();
}

class _StepperUsageState extends State<StepperUsage> {
  int _currentStep = 0;
  String? username, mail, password;
  final key0 = GlobalKey<FormFieldState>(), key1 = GlobalKey<FormFieldState>(), key2 = GlobalKey<FormFieldState>();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Usage"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: _allSteps,
          currentStep: _currentStep,
          /*onStepTapped: (deger) {
            setState(() {});
            _currentStep = deger;
          },*/
          onStepContinue: () {
            setState(() {});
            _continueControl();
          },
          onStepCancel: () {
            setState(() {});
            if (_currentStep > 0) {
              _currentStep--;
            } else {
              debugPrint("baş");
            }
          },
          controlsBuilder: (context, details){
            if(details.currentStep==_allSteps.length-1){
              return Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  ElevatedButton(onPressed: details.onStepContinue, child: Text("Kaydet!!")),
                  Padding(padding: EdgeInsets.only(right: 7.5)),
                  ElevatedButton(onPressed: details.onStepCancel, child: Text("Geri!!"))
                ],
              ),
            );
            }
            return Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  ElevatedButton(onPressed: details.onStepContinue, child: Text("Devamm!!")),
                  Padding(padding: EdgeInsets.only(right: 7.5)),
                  ElevatedButton(onPressed: details.onStepCancel, child: Text("Geri!!"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Step> get _allSteps {
    return <Step>[
      Step(
          title: Text("Username"),
          state: _adjustStates(0),
          isActive: true,
          content: Container(
              margin: EdgeInsets.only(top: 5),
              child: TextFormField(
                onSaved: (deger){
                  username = deger;
                },
                key: key0,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    icon: Icon(Icons.supervised_user_circle),
                    labelText: "Username Label",
                    hintText: "Username Hint",
                    border: OutlineInputBorder()),
                validator: (deger) {
                  if(deger!.length < 8){
                    return "Username can not be shorter than 8 characters.";
                  }
                  else{
                    return null;
                  }
                },
              )),
          subtitle: Text("Username Subtitle")),
      Step(
          title: Text("Mail"),
          state: _adjustStates(1),
          isActive: true,
          content: Container(
              margin: EdgeInsets.only(top: 5),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onSaved: (deger){
                  mail = deger;
                },
                validator: (deger) {
                  if(!EmailValidator.validate(deger!)){
                    return "Invalid email.";
                  }
                  else{
                    return null;
                  }
                },
                key: key1,
                  decoration: InputDecoration(
                      icon: Icon(Icons.supervised_user_circle),
                      labelText: "Mail Label",
                      hintText: "Mail Hint",
                      border: OutlineInputBorder()))),
          subtitle: Text("Mail Subtitle")),
      Step(
          title: Text("Password"),
          state: _adjustStates(2),
          isActive: true,
          content: Container(
              margin: EdgeInsets.only(top: 5),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onSaved: (deger){
                  password = deger;
                },
                validator: (deger) {
                  if(deger!.length < 8){
                    return "Password can not be shorter than 8 characters.";
                  }
                  else{
                    return null;
                  }
                },
                key: key2,
                  decoration: InputDecoration(
                      icon: Icon(Icons.supervised_user_circle),
                      labelText: "Password Label",
                      hintText: "Password Hint",
                      border: OutlineInputBorder()))),
          subtitle: Text("Password Subtitle"))
    ];
  }
  
  _adjustStates(int i) {
    if(i < _currentStep){
      return StepState.complete;
    }
    else if(i == _currentStep){
      if(error){
        return StepState.error;
      }
      return StepState.editing;
    }
    else{
      return StepState.disabled;
    }
  }

  void _continueControl(){
    debugPrint("test");
    switch(_currentStep){
      case 0:
        if(key0.currentState!.validate()){
          key0.currentState!.save();
          error = false;
          _currentStep = 1;
        } else{
          error = true;
        }
        break;
      case 1:
        if(key1.currentState!.validate()){
          key1.currentState!.save();
          error = false;
          _currentStep = 2;
        } else{
          error = true;
        }
        break;
      case 2:
        if(key2.currentState!.validate()){
          key2.currentState!.save();
          error = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Username: $username Email: $mail Password: $password")));
        } else{
          error = true;
        }
        break;
    }
  }
}
