import 'package:flutter/material.dart';

import 'model/burc.dart';

class SignDetail extends StatelessWidget {
  final Sign selectedSign;
  const SignDetail({required this.selectedSign});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(title: Text(selectedSign.signName + " Burcu ve Özellikleri"), centerTitle: true, background: Image.asset("images/" + selectedSign.signLargeImage, fit: BoxFit.cover,),),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(16),
              child: SingleChildScrollView(child: Text(selectedSign.signDetail, style: Theme.of(context).textTheme.subtitle1,))),
          )
        ],
      )
    );
  }
}