import 'package:path/path.dart';
import 'package:restaurant_order/MainScreen.dart';

import 'db.dart';
import 'grocery.dart';
import 'package:flutter/material.dart';

class menuAdd extends StatefulWidget {
  @override
  _menuAddState createState() => _menuAddState();
}

class _menuAddState extends State<menuAdd> {
  int? selectedId;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText:'등록할 메뉴의 이름을 입력해주세요',
              labelStyle:TextStyle(fontSize:25,),
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          selectedId != null
              ? await DatabaseHelper.instance.update(
            Grocery(id: selectedId, name: textController.text),
          )
              : await DatabaseHelper.instance.add(
            Grocery(name: textController.text),
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainScreen()));
          setState(() {
            textController.clear();
            selectedId = null;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
