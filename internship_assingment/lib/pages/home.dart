import 'package:flutter/material.dart';
import 'package:internship_assingment/utils/dialog_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final _controller = TextEditingController();
  List _toDoList = [
    ["This is the first comment" ,]
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      _toDoList[index][1] = !_toDoList[index][1];
    });
  }
  void saveNewTask() {
    setState(() {
      _toDoList.add([_controller.text,]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
          );
        });
  }
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Column(
       children: [
         Container(
           height: 250.0,
           decoration: BoxDecoration(
             color: Color(0xFFF6F9FF),
             borderRadius: BorderRadius.only(
               bottomRight:Radius.circular(40),
               bottomLeft: Radius.circular(40),
             ),

             boxShadow: [
               BoxShadow(
                 color: Colors.grey.shade300,
                 blurRadius: 3.0, // soften the shadow
                 spreadRadius: 1.0, //extend the shadow
                 offset: Offset(
                   2.0, // Move to right 5  horizontally
                   2.0, // Move to bottom 5 Vertically
                 ),
               )
             ],
           ),

           child: Column(
             children: [
               Container(
                 height: 110,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(
                       bottomRight:Radius.circular(40),
                       bottomLeft: Radius.circular(40),
                     )
                 ),
                 child: Center(
                     child: Text(
                       "Add Comment",
                       style: TextStyle(
                         fontSize: 25,
                         fontWeight: FontWeight.w700,
                       ),
                     )
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
               Container(
                 child:Image(
                    height: 120,
                     image: AssetImage(
                     "assets/images/card.png",
                 )
                 ),
               ),
             ],
           ),
         ),
         SizedBox(
           height: 20,
         ),
         Container(
           padding: EdgeInsets.all(20),
           child: TextField(
             decoration: InputDecoration(
               contentPadding:
               const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
               prefixIcon: const Icon(Icons.search),
               hintText: "Search",
               fillColor: Color(0xFFF1F1F4),
               filled: true,
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50),
               )
             ),
           ),
         ),

        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFF1F1F4),
            border: Border.all()
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE2E3F7)
                ),
                child: Text("IM"),
              ),

              Text(
                  "This is the First Comment.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
              ),

             IconButton(onPressed: (){
               createNewTask();
             },
                 icon: Icon(Icons.add,color: Color(0xFFADADB5)
                   ,)
             ),
            ],
          ),
        )
       ],
     ),
    );
  }
}
