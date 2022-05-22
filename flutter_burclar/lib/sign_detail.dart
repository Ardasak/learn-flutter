import 'package:flutter/material.dart';
import 'package:flutter_burclar/main.dart';
import 'package:palette_generator/palette_generator.dart';

import 'model/sign.dart';

class SignDetail extends StatefulWidget {
  final Sign selectedSign;
  const SignDetail({required this.selectedSign});

  @override
  State<SignDetail> createState() => _SignDetailState();
}

class _SignDetailState extends State<SignDetail> {
  Color appBarColor = Colors.pink;
  late PaletteGenerator _paletteGenerator;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: [
          MyAppBar(selectedSign: widget.selectedSign),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(16),
              child: SingleChildScrollView(child: Text(widget.selectedSign.signDetail, style: Theme.of(context).textTheme.subtitle1,))),
          )
        ],
      )
    );
  }
}

class MyAppBar extends StatefulWidget {
  Sign selectedSign;
  MyAppBar({required this.selectedSign, Key ? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  Color appBarColor = Colors.pink;
  late PaletteGenerator _paletteGenerator;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            
            backgroundColor: appBarColor,
            flexibleSpace: FlexibleSpaceBar(title: Text(widget.selectedSign.signName + " Burcu ve Özellikleri"), centerTitle: true, background: Image.asset("images/" + widget.selectedSign.signLargeImage, fit: BoxFit.cover,),),
          );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {adjustAppBarColor();});
  }

  void adjustAppBarColor() async {
    _paletteGenerator = await PaletteGenerator.fromImageProvider(AssetImage("images/" + widget.selectedSign.signLargeImage));
    appBarColor = _paletteGenerator.vibrantColor!.color;
    setState(() {
      
    });
  }
}