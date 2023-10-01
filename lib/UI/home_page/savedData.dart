import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/UI/all_data/appColors.dart';
import 'package:flutter_task/UI/all_data/font_sizes.dart';

class SavedData extends StatefulWidget {
  const SavedData({Key? key}) : super(key: key);

  @override
  State<SavedData> createState() => _SavedDataState();
}

class _SavedDataState extends State<SavedData> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SavedData"),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text("SavedData"))]),
    );
  }


}
