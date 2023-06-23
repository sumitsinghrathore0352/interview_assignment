import 'package:flutter/material.dart';

import 'my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
   DialogBox({Key? key, required this.controller ,required this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
              child: Text("Type below"),
             ),
             SizedBox(
               height: 10,
             ),
             TextField(
                 decoration: InputDecoration(
                   contentPadding:
                   const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                     hintText: "Comment",
                     fillColor: Color(0xFFF1F1F4),
                     filled: true,
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                     )
                 )
             ),
              SizedBox(
                height: 10,
              ),
             myButton(text: "Add", onPressed: onSave),
           ],
        ),
      ),
    );
  }
}
