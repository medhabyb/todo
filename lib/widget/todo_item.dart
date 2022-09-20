import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final Todo td;
  final ontodochanged;
  final ondelete;
  const ToDoItem({Key? key, required this.td, required this.ontodochanged, required this.ondelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          //print('Hello');
          ontodochanged (td);

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
          contentPadding:EdgeInsets.symmetric(horizontal:20, vertical: 5) ,


        tileColor: Colors.white12,
        leading: Icon( td.isd?  Icons.check_box : Icons.check_box_outline_blank, color: tdBlue,) ,
        title: Text(td.todo!
          , style: TextStyle(
            fontSize: 16,
            color: tdBlack,
          decoration: td.isd? TextDecoration.lineThrough : null,

        ),),
        trailing: Container(
          padding: EdgeInsets.all(0),
           margin: EdgeInsets.symmetric(vertical:12 ),
          height : 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: tdRed,

          ),
            child:IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),

              onPressed: (){
                //print ('deleted');
                ondelete(td.id);
              }
              ,

            )
        )




      ),
    );
  }
}
